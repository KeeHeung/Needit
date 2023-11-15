package web.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
import web.dto.Comment;
import web.dto.FileTb;
import web.dto.Like;
import web.service.face.MenuShareFace;
import web.util.Paging;

@Controller
@RequestMapping("/menu/share")
public class MenuShareController {
	
	//로그 객체 
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Autowired MenuShareFace menuShareFace;
	
	@GetMapping("/list")
	public String list(
			Board board, Paging param
			, Model model,FileTb file
			, Like like) {
		logger.info("list get");
		
		//페이징 계산
		Paging paging = menuShareFace.getPaging(param);
		
		//나눔 게시판 조회
		List<Map<String, Object>> list = menuShareFace.selectBoardStatus(paging, board);
		
		logger.info("리스또{}",list);
		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
		
		file.setBoardNo(board.getBoardNo());	
		
		List<FileTb> fileData = menuShareFace.getImg(file);
		logger.info("{}", fileData);
		model.addAttribute("fileData",fileData);
		
		return "menu/share/list";
	}
	
	@RequestMapping("/view")
	public void view(
			Board board, HttpSession session
			, Model model, Like like
			) {
		like.setLikeId((String)session.getAttribute("id"));
		Board view = menuShareFace.view(board);
		
		//첨부파일 정보 전달
		List<FileTb> boardfile = menuShareFace.getAttachFile( board );
		model.addAttribute("boardfile", boardfile);
		
		logger.info("보드넘버{}",view);
		model.addAttribute("view", view);
		
		//총 추천수 조회
		int likeCount = menuShareFace.selectLikeCnt(like);
		model.addAttribute("likeCount",likeCount);
		
		//추천이 되있는지 안되있는지 확인
		boolean isLike = menuShareFace.checkLike(like);
		model.addAttribute("isLike",isLike);
		
	}
	
	@GetMapping("/write")
	public void write( Board board ) {
	}
	
	@PostMapping("/write")
	public String writeProc(
		Board writerContent,
		HttpSession session,
		List<MultipartFile> upFile
			) {
		writerContent.setWriterId((String)session.getAttribute("id"));
		writerContent.setWriterNick((String)session.getAttribute("nick"));
		//글작성
		menuShareFace.write(writerContent,upFile);
		logger.info("writerContent{}",writerContent);
		
		return "redirect:/menu/share/view?boardNo=" + writerContent.getBoardNo();
	}
	
	@GetMapping("/update")
	public String update(Board updateParam, Model model) {
		
		if( updateParam.getBoardNo() > 1 ) {
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

		
		
		return "menu/share/update";
		
	}
	
	@PostMapping("/update")
	public String updateProc(
			Board updateParam
			, List<MultipartFile> file
			, int[] delFileno
			, HttpSession session
			, Model model) {
		
		logger.info("updateParam {}", updateParam);
		logger.info("file {}", file);
		logger.info("delFileno {}", Arrays.toString(delFileno));


		updateParam.setWriterId((String) session.getAttribute("id"));
		updateParam.setWriterNick((String) session.getAttribute("nick"));
		
		menuShareFace.updateBoard(updateParam, file, delFileno);
		
		return "redirect:./view?boardNo=" + updateParam.getBoardNo();
	}
	
	@RequestMapping("/delete")
	public String delete(Board deleteParam, Model model) {
		
		if( deleteParam.getBoardNo() < 1 ) {
			return "redirect:/menu/share/list";
		}

		menuShareFace.delete( deleteParam );
		
		return "redirect:./list?menu=" + deleteParam.getMenu();
	
	}
	
	@RequestMapping("/like")
	public String list(
			Board board
			, HttpSession session
			,Model model, Like like ) {
		
		
		like.setBoardNo(board.getBoardNo());
		like.setLikeId((String)session.getAttribute("id"));
		
		//총 추천수 조회
		int likeCount = menuShareFace.selectLikeCnt(like);
		
		//추천이 되있는지 안되있는지 확인
		boolean isLike = menuShareFace.checkLike(like);
		logger.info("isLike", isLike);
		model.addAttribute("isLike",isLike);
		model.addAttribute("likeCount",likeCount);
		
		
		return "jsonView";
	}
	
	//댓글입력
	@PostMapping("/comment/insert")
	public String commentinsert(
			Comment comment, HttpSession session
			, Model model) {
		comment.setWriterId((String)session.getAttribute("id"));
		comment.setWriterNick((String)session.getAttribute("nick"));
		
		logger.info("코멘트나와야함{}",comment);
		
		//댓글 입력
		menuShareFace.commentinsert(comment);
		
		return "redirect:/menu/share/comment/list?boardNo=" + comment.getBoardNo();
	}
	
	//댓글 리스트
	@GetMapping("/comment/list")
	public String list(
			Comment comment
			, HttpSession session
			, Model model) {
		comment.setWriterId((String)session.getAttribute("id"));
		comment.setWriterNick((String)session.getAttribute("nick"));
		//댓글 리스트 전달
		List<Comment> commentList = menuShareFace.list(comment);
		model.addAttribute("commentList", commentList);
		
		return "jsonView";
		
	}
	
	//댓글 삭제
	@RequestMapping("/comment/delete")
	public String delete(Comment commentDelete) {
		logger.info("commentDelete : {}", commentDelete);
		
		menuShareFace.commentdelete(commentDelete);
		
		return "jsonView";
	}
	
	@GetMapping("/calendar")
	public void calendar() {
		
	}
	
	
	
	
	

}
