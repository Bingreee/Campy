package campy.com.controller;

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
	public MemberDto getCampingDto() {
		return new MemberDto();
	}
	
	@RequestMapping("/main")
	public String main() {
		return "/main";
	}
	
	/* 차후 로그인 페이지 만들어지면 "/main"이 요청될 때 이것으로 수정하도록 한다.
	 * @RequestMapping("/main") //RequestMapping 어노테이션은 url을 컨트롤러의 메서드와 매핑할 때 쓰는
	 * 어노테이션이다. public String main(@ModelAttribute("user") MemberDto dto) {
	 * if(dto.getId() != null) { return "/main"; }else { return "/login"; } }
	 */
	
	/*
	 * @RequestMapping("/login") public String login() { return "/login"; }
	 */
	
	/* 로그인 페이지 만들어지면 login uri 받았을 때 이 쪽으로 수정할 것
	 * @PostMapping("/login") public String login(@ModelAttribute("command") @Valid
	 * MemberDto dto, BindingResult error, Model m) {
	 * 
	 * MemberDto resultDto = service.login(dto); if(resultDto == null) {
	 * error.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀림"); return "member/loginform";
	 * }else {//로그인 성공 m.addAttribute("user", resultDto); } return "redirect:/main";
	 * }
	 */
	
	@RequestMapping("/join")
	public String join() {
			return "/join";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "/mypage";
	}
	
	@PostMapping("/mainSearch")
	public String mainSearch(@ModelAttribute("mainSearchInfo") CampingDto dto, Model m) {
		CampingDto mainSearchInfoResult=service.mainSearch(dto);
		m.addAttribute("mainSearchInfoResult", mainSearchInfoResult);
		return "/main";
	}
}
