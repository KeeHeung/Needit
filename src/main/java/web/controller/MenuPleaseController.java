package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.FileTb;
import web.dto.Like;
import web.service.face.MenuPleaseService;
import web.util.Paging;

@Controller
@RequestMapping("/menu/please")
public class MenuPleaseController {
   private final Logger logger = LoggerFactory.getLogger( this.getClass() );
   
   @Autowired private MenuPleaseService menuPleaseService;
   
   @GetMapping("/list")
   public void list( Paging param, Model model ) {
      
      //페이징 계산
      Paging paging = menuPleaseService.getPaging(param);
      logger.info("{}", paging);
      
      //게시글 목록 조회
      List<Board> list = menuPleaseService.list( paging );
      
      model.addAttribute("paging", paging);
      model.addAttribute("list", list);
      
   }
   
   @GetMapping("/view")
   public String view(Board viewBoard, Model model, HttpSession session) {
      
      if( viewBoard.getBoardNo() < 1 ) {
         return "redirect:./list";
      }
      
      
      //상세보기 게시글 조회
      viewBoard = menuPleaseService.view(viewBoard);
      model.addAttribute("viewBoard", viewBoard);
      
      
      //첨부파일 정보 전달 FileTb
      List<FileTb> fileTb = menuPleaseService.getAttachFile(viewBoard);
      model.addAttribute("fileTb", fileTb);
      logger.info("fileTb : {}", fileTb);
      
      
	  //추천 상태 조회
      Like like = new Like();
      like.setBoardNo(viewBoard.getBoardNo()); //게시글 번호
      like.setLikeId((String)session.getAttribute("id")); //로그인한 아이디
      
      
      //추천 상태 전달
      boolean isLike = menuPleaseService.isLike(like);
      model.addAttribute("isLike", isLike);
      model.addAttribute("cntLike", menuPleaseService.getTotalCntLike(like));
      
      return"menu/please/view";
      
   }
   
   
   @GetMapping("/write")
   public void write() {}
   
   
   @PostMapping("/write")
   public String writeProc(Board writeParam, List<MultipartFile> file, HttpSession session, Model model) {
      logger.info("writeParam : {}", writeParam);
      
      writeParam.setWriterId((String) session.getAttribute("id"));
      writeParam.setWriterNick((String) session.getAttribute("nick"));
      

      List<Board> menu = menuPleaseService.getMenu(writeParam);
      logger.info("menu : {}", menu);
      
      model.addAttribute("menu", menu);
      
      menuPleaseService.write(writeParam,file);
      logger.info("writeParam : {}", writeParam);
      
      
      return "redirect:./view?boardNo=" + writeParam.getBoardNo();
   }
   
   
   @RequestMapping("/download")
	public String down(FileTb fileTb, Model model) {
		
		//첨부파일 정보 조회
		fileTb = menuPleaseService.getFile(fileTb);
		model.addAttribute("fileTb", fileTb);
		
		return "down";
	}
   
   
   
   
   @GetMapping("/update")
   public String update(Board updateBoard, Model model) {
	   
	   if (updateBoard.getBoardNo() < 1) {
		   return "redirect:./list";
	   }
		
	   	updateBoard = menuPleaseService.updateSelect(updateBoard);
	   	
	   	model.addAttribute("updateBoard", updateBoard);
	   	
		return "board/update";
		   
   }
   
   
   
   @PostMapping("/update")
   public String updateProc(
		   
		   Board updateBoard,
		   MultipartFile file
		   ) {
	   logger.info("file: {}", file);
	   
	   menuPleaseService.updateBoard(updateBoard);
	   menuPleaseService.updateFilesave(file, updateBoard);
	   
	   return "redirect:./list";
   }
   
   @RequestMapping("/delete")
   public String delete(Board deleteParam, Model model ) {
	   
	   if( deleteParam.getBoardNo() < 1 ) {
			return "redirect:./list";
		}
	   
	   menuPleaseService.delete(deleteParam);
	   
	   return "redirect:./list";
   }
   
   
}