package web.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import web.dto.Banner;
import web.service.face.MainService;

@Controller
public class MainController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired MainService mainService;
	
	@GetMapping("/main")
	public String main(Model model) {
		logger.info("메인화면 진입");
		List<Banner> bannerNames = new ArrayList<Banner>();

		mainService.getBannerNo(bannerNames);
		
		model.addAttribute("file", bannerNames);
		return "main/main";
	}
	
	
}
