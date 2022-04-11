package campy.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import campy.com.dto.MemberDto;
import campy.com.service.MypageService;

@Controller
@SessionAttributes({"user","mypage_pwchecker"})
public class MypageController {
	/*
	 * @RequestMapping("/mypage") public String mypage() { return "/mypage"; } //CampingController의 매핑과 중복이므로 생략
	 */
	
	@Autowired
	MypageService Service;
	
	
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	
	@ModelAttribute("mypage_pwchecker")
	public String getPw() {
		return "";
	}
	
	
	@RequestMapping("/memLove")
	public String memLove() {
			return "/memLove";
	}
	
	@RequestMapping("/reserveStatus")
	public String reserveStatus() {
			return "/reserveStatus";
	}
	
	@RequestMapping("/qna")
	public String qna() {
			return "/qna";
	}
	
	@RequestMapping("/ask")
	public String ask() {
			return "/ask";
	}
	
	@RequestMapping("/memUpdateCheck")
	public String memUpdateCheck() {
			return "/memUpdateCheck";
	}
	
	@RequestMapping("/memUpdateCheckYes")
	public String memUpdateCheckYes() {
			return "/memUpdate";
	}
	
	@RequestMapping("/memUpdateChecker")
	public String memUpdateChecker(@ModelAttribute("user") MemberDto dto , @RequestParam String pw) {
		System.out.println(dto.getPw()+","+pw);
		if(dto.getPw()==pw) {
			return "/memUpdate";
		}
		else {
			return "/memUpdateCheck";
		}
	}
	
}
