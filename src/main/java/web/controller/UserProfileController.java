package web.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.service.face.UserProfileService;

@Controller
@RequestMapping("/profile")
public class UserProfileController {
	
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired UserProfileService userProfileService;
	
	@GetMapping("/infoupdate")
	public String infoUpdate( ) {
		return "profile/userUpdate";
	}

	@PostMapping("/infoupdate")
	public void infoUpdateProc() {
		
	}
	
	
	@GetMapping("/imgupdate")
	public String imgUpdate(HttpSession session, HttpServlet req, RedirectAttributes redirectAttributes) {
		return "profile/view";
	}
	
	

	
}
