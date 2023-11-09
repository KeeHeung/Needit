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

import web.dto.Board;
import web.service.face.MenuRentService;
import web.util.Paging;

@Controller
@RequestMapping("/menu/rent")
public class MenuRentController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired private MenuRentService menuRentService;
	
	//게시판 목록 띄우기
	@GetMapping("/list")
	public String list( Paging param, Model model ) {
		logger.info("param : {}", param.getMenu());
		
		//페이징 계산
		Paging paging = menuRentService.getPaging(param);
		
		//게시글 목록 조회
		List<Board> list = menuRentService.list(paging); 
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return "/menu/rent/list";
	}
	
	//게시판 상세 조회
	@RequestMapping("/view")
	public String view( Board board, Model model, HttpSession session ) {
		
		//게시글 번호를 전달받지 못하면 목록으로 이동
		if( board.getBoardNo() < 1 ) {
			return "redirect:/menu/rent/list";
		}
		
		//게시글 상세 조회
		board = menuRentService.view(board);
		model.addAttribute("board", board);
		
		return "menu/rent/view";
	}

	//파일 다운로드
	@RequestMapping("/download")
	public void down() {}
	
	//게시글 위치
	@GetMapping("/loc")
	public void loc() {}
	
	//대여 처리
	@PostMapping("/rent")
	public void rent() {}
	
	//예약 처리
	@PostMapping("/book")
	public void book() {} 
	
	//결제 처리
	@PostMapping("/pay")
	public void pay() {} 
	
	//게시글 작성 폼
	@GetMapping("/write")
	public void write() {} 
	
	//게시글 작성 처리
	@PostMapping("/write")
	public void writeProc() {}

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
	@PostMapping("/like")
	public void like() {}
	
	//게시글 신고
	@PostMapping("/report")
	public void report() {}
	
}
