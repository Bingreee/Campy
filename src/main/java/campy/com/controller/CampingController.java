package campy.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import campy.com.dto.MemberDto;

@Controller
public class CampingController {
	
	@RequestMapping("/main")
	public String main() {
		return "/main";
	}
	
	/* 차후 로그인 페이지 만들어지면 "/main"이 요청될 때 이것으로 수정하도록 한다.
	 * @RequestMapping("/main") //RequestMapping 어노테이션은 url을 컨트롤러의 메서드와 매핑할 때 쓰는
	 * 어노테이션이다. public String main(@ModelAttribute("user") MemberDto dto) {
	 * if(dto.getId() != null) { return "/main"; }else { return "/login"; } }
	 */
	
	@RequestMapping("/login")
	public String login() {
			return "/login";
	}
	
	@RequestMapping("/join")
	public String join() {
			return "/join";
	}
}
