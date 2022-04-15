package campy.com.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import campy.com.dto.CampingDto;
import campy.com.dto.MemberDto;
import campy.com.service.CampingService;

@SessionAttributes({"user","mainSearchInfoResult"})
@Controller
public class CampingController {
	
	@Autowired
	CampingService service;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	
	@ModelAttribute("mainSearchInfoResult")
	public List<CampingDto> getCampingDto() {
		return null;
	}
	
	
	@ModelAttribute("mainSelectC_no")
	public int getMainSelectC_no() {
		return 0;
	}
	
	
	@RequestMapping("/main")
	public String main(@ModelAttribute("mainSearchInfoResult") CampingDto dto) {
		return "/main";
	}
	
	
	@RequestMapping("/join")
	public String join() {
			return "/join";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "/mypage";
	}
	
	@RequestMapping("/mainToRoom")
	public String mainToRoom(@ModelAttribute("mainSelectC_no") int a, Model m) {
		m.addAttribute("roomC_no", a);
		System.out.println("roomC_no");
		return "/room";
	}
	
	@PostMapping("/mainSearch")
	public String mainSearch(@ModelAttribute("mainSearchInfo") CampingDto dto, Model m) {
		System.out.println("mainSearch 들어왔음");
		System.out.println(dto);
		List<CampingDto> mainSearchInfoResult=service.mainSearch(dto);
		m.addAttribute("mainSearchInfoResult", mainSearchInfoResult);
		System.out.println(mainSearchInfoResult+"mainSearch메서드 In Controller");
		return "/main";
	}
}
