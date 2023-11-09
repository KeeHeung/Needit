package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.User;
import web.service.face.UserService;


@Controller
@RequestMapping("/user")
public class LoginController {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired UserService userService;


	@GetMapping("/signup")
	public void signUp() {}
	
	@PostMapping("/join")
	public String signUpProc( User user) {
		logger.info("회원가입 : {}",user);
		
		userService.join(user);
		
		return "redirect:./login";
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String loginProc( User user, HttpSession session) {
		
		boolean islogin = userService.login(user);
		session.setAttribute("isLogin", islogin);
		
		if(islogin) {
			logger.info("로그인 성공 {}",user);
			session.setAttribute("id", user.getId());
			return"redirect:../main";
		} else {
			logger.info("로그인 실패");
			return"redirect:./login";
		}
		
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:../";
		
	}
}
