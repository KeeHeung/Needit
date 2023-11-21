package web.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Board;
import web.dto.Comment;
import web.dto.FileTb;
import web.dto.Like;
import web.service.face.MenuCommunityService;
import web.util.Paging;

@Controller
@RequestMapping("/community")
public class MenuCommunityController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired private MenuCommunityService menuCommunityService;
	
	//게시판 목록 띄우기
	@GetMapping("/list")
	public String list( Paging param, Model model ) {
		logger.info("param : {}", param);
		//페이징 계산
		Paging paging = menuCommunityService.getPaging(param);
		
		//게시글 목록 조회
		List<Map<String, Object>> list = menuCommunityService.list(paging); 
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return "menu/community/list";
	}
	
	//게시판 상세 조회
	@GetMapping("/view")
	public String view( Board board, Model model, HttpSession session ) {

		//게시글 번호를 전달받지 못하면 목록으로 이동
		if( board.getBoardNo() < 1 ) {
			return "redirect:/community/list";
		}
		
		//게시글 상세 조회
		board = menuCommunityService.view(board);
		model.addAttribute("board", board);
		logger.info(board.toString());
		
		//첨부파일 정보 전달
		List<FileTb> fileTb = menuCommunityService.getAttachFile( board );
		model.addAttribute("fileTb", fileTb);
		
		//추천 상태 조회
		Like like = new Like();
		like.setBoardNo(board.getBoardNo()); //게시글 번호
		like.setLikeId((String)session.getAttribute("id")); //로그인한 아이디

		//추천 상태 전달
		boolean isLike = menuCommunityService.isLike(like);
		model.addAttribute("isLike", isLike);
		model.addAttribute("cntLike", menuCommunityService.getTotalCntLike(like));
		
		return "menu/community/view";
	}

	//파일 다운로드
	@GetMapping("/download")
	public String down( FileTb fileTb, Model model ) {
		
		//첨부파일 정보 조회
		fileTb = menuCommunityService.getFile( fileTb );
		model.addAttribute("downFile", fileTb);
		
		return "down";
	}

	//게시글 작성 폼
	@GetMapping("/write")
	public String write() {
		return "menu/community/write";
	}
	
	//게시글 작성 처리
	@PostMapping("/write")
	public String writeProc( Board writeParam, List<MultipartFile> file, HttpSession session ) {
		logger.info("writeParam : {}", writeParam );
		
		//작성자 id, nick 세팅
		writeParam.setWriterId((String) session.getAttribute("id"));
		writeParam.setWriterNick((String) session.getAttribute("nick"));
		
		//게시글 저장
		menuCommunityService.write( writeParam, file );
		
		return "redirect:/community/view?boardNo=" + writeParam.getBoardNo();
	}

	//게시글 수정 폼
	@GetMapping("/update")
	public void update() {} 

	//게시글 수정 처리
	@PostMapping("/update")
	public void updateProc() {} 

	//게시글 삭제
	@RequestMapping("/delete")
	public void delete() {}

	//추천 적용
	@GetMapping("/like")
	public ModelAndView like( Like like, ModelAndView mav, HttpSession session  ) {
		logger.info("like : {}", like);
		
		//추천 정보 토글
		like.setLikeId((String) session.getAttribute("id"));
		boolean result = menuCommunityService.like(like);
		mav.addObject("result", result);
		
		//추천 수 조회
		int cnt = menuCommunityService.getTotalCntLike(like);
		mav.addObject("cnt", cnt);

		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//댓글 입력하기
	@PostMapping("/comment")
	public String insert(Comment commentParam, Board board) {
		logger.info("댓글 전달인자 commentParam: {}", commentParam);
		logger.info("댓글 전달인자 board: {}", board);
		
		menuCommunityService.commentInsert(commentParam);
		
		return "redirect: /community/view?boardNo=" + board.getBoardNo();
	}
	
	//댓글 불러오기
	@GetMapping("/comment/list")
	public String viewComment(Comment commentParam, Model model) {
		logger.info("commentParam: {}", commentParam);
		
		List<Comment> commentList = menuCommunityService.viewComment(commentParam);
		logger.info("저장된 댓글:" + commentList.toString());
		
		model.addAttribute("commentList", commentList);
		
		return "jsonView";
	}
	
	//댓글 삭제
	@GetMapping("/comment/delete")
	public String delete(Comment commentDelete) {
		logger.info("commentDelete : {}", commentDelete);
		
		menuCommunityService.delete(commentDelete);
		
		return "jsonView";
	}
	
	//게시글 신고
	@PostMapping("/report")
	public void report() {}
	
}