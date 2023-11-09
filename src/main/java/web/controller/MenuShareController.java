package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.FileTb;
import web.service.face.MenuShareFace;
import web.util.Paging;

@Controller
@RequestMapping("/menu/share")
public class MenuShareController {
	
	//로그 객체 
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Autowired MenuShareFace menuShareFace;
	
	@GetMapping("/list")
	public String list(Board board, Paging param, Model model) {
		logger.info("list get");
		
		//페이징 계산
		Paging paging = menuShareFace.getPaging(param);
		
		//나눔 게시판 조회
		List<Board> list = menuShareFace.selectBoardStatus(paging, board);
		logger.info("{}",list);
		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
		
		
		return "menu/share/list";
	}
	
	@GetMapping("/thumbnail")
	public String thumbNail(Board board, FileTb file,Model model) {
		
		file.setBoardNo(board.getBoardNo());	
		
		List<FileTb> fileData = menuShareFace.getImg(file);
		logger.info("{}", fileData);
		
		model.addAttribute("fileData",fileData);
		
		
		return "jsonView";
	}
	@RequestMapping("/view")
	public String view(
			Board board, HttpSession session
			, Model model
			) {
		
		Board view = menuShareFace.view(board);
		
		logger.info("보드넘버{}",view);
		model.addAttribute("view", view);
		
		return "menu/share/view";
		
	}
	
	@GetMapping("/write")
	public void write( Board board ) {
	}
	
	@PostMapping("/write")
	public String writeProc(
		Board writerContent,
		HttpSession session,
		Model model,
		@RequestParam("file") List<MultipartFile> upFile
			) {
		writerContent.setWriterId((String)session.getAttribute("id"));
		logger.info("sdgsgd{}",writerContent);
		//메뉴
//		List<Board> menuData = menuShareFace.menu(writerContent);
//		logger.info("menuData{}",menuData);
		logger.info("writerContent{}",writerContent);
		
		//글작성
		menuShareFace.write(writerContent,upFile);
		logger.info("writerContent{}",writerContent);
		
		return "menu/share/list";
	}
	
	@GetMapping("/update")
	public String update(Board updateParam, Model model) {
		
		if( updateParam.getBoardNo() < 1 ) {
			return "redirect:./list";
		}

		
		
		//상세보기 페이지 아님 표시
		updateParam.setHit(-1);
		
		
		//상세보기 게시글 조회
		updateParam = menuShareFace.view(updateParam);
		model.addAttribute("updateBoard", updateParam);

		//첨부파일 정보 전달
		List<FileTb> boardfile = menuShareFace.getAttachFile( updateParam );
		model.addAttribute("boardfile", boardfile);
		
		return "board/update";
		
	}
	
	@PostMapping("/update")
	public void updateProc() {
		
	}
	
	
	
	

}
