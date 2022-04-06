package campy.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import campy.com.dto.MemberDto;

@Controller
@SessionAttributes("user")
public class MypageController {
	/*
	 * @RequestMapping("/mypage") public String mypage() { return "/mypage"; } //CampingController의 매핑과 중복이므로 생략
	 */
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
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
	
}
