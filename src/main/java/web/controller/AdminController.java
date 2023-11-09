package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Banner;
import web.service.face.AdminService;

@Controller
public class AdminController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired AdminService adminService;
	
	//소개 페이지(오프닝 페이지)
	@GetMapping("/opening")
	public void opening() {}
	
	//푸터
	@GetMapping("/layout/footer")
	public void main() {}
	
	//이용약관
	@GetMapping("/terms/term")
	public void term() {}
	
	//개인정보처리방침
	@GetMapping("/terms/privacyPolicy")
	public void privacyPolicy() {}

	//위치기반서비스 이용약관
	@GetMapping("/terms/locationPolicy")
	public void locationPolicy() {}

	//고객센터
	@GetMapping("/admin/customerService")
	public void customerService() {}
	
	//고객센터 -> 공지사항
	@GetMapping("/admin/notice")
	public void notice() {}
	
	//고객센터 -> FAQ
	@GetMapping("/admin/faq")
	public void faq() {}
	
	//고객센터 -> 1:1채팅
	@GetMapping("/admin/chat")
	public void chat() {}
	
	//-------------------------------------
	
	//관리자 로그아웃
	@RequestMapping("/main/main")
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	//관리자 메인페이지
	@GetMapping("/admin/admin")
	public void admin() {}
	
	//관리자 일일 방문자수 조회
	@GetMapping("/admin/dayVisit")
	public void dayVisit() {}

	//관리자 신고접수 목록
	@GetMapping("/admin/reportList")
	public void reportList() {}
	
	//관리자 업체요청 목록 
	@GetMapping("/admin/businessReq")
	public void businessReq() {}

	//관리자 메인배너 접속
	@GetMapping("/admin/bannerUpdate")
	public void banner() {}
	
	//관리자 메인배너 수정
	@PostMapping("/admin/bannerUpdate")
	public String bannerUpdate( 
			Banner bannerParam, 
			List<MultipartFile> file,
			HttpSession session 
			) {
		logger.info("bannerParam : {}", bannerParam.getBannerNo());
		
		adminService.bannerUpdate(bannerParam, file);
		
		return "redirect:/admin/bannerUpdate";
		
	}
	
	
	//관리자 공지등록 
	@GetMapping("/admin/noticeUpdate")
	public void noticeUpdate() {}
	
	//관리자 회원이메일 발송 
	@GetMapping("/admin/emailSend")
	public void emailSend() {}
	
	//-------------------------------------

	
	
	
}
