package campy.com.controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import campy.com.dto.MemberDto;
import campy.com.service.LoginService;

@Controller
@SessionAttributes("user")
public class LoginController {
	
	@Autowired
	LoginService service;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/memLogin")
	public String memLogin (@ModelAttribute("command") @Valid MemberDto dto, BindingResult error, Model m) {
		
		if(error.hasErrors()) {
			return "login";
		}
		
		MemberDto resultDto = service.memLogin(dto);
		if(resultDto == null) {
			error.reject("nocode", "아이디나 비밀번호가 틀렸습니다.");
			return "login";
		}else {
			m.addAttribute("user", resultDto);
		}
		return "redirect:/main";
	}
	
	@GetMapping("/joinSelect")
	public String joinSelect() {
		return "joinSelect";
	}
	
	@GetMapping("/insert")
	public String join() {
		return "join";
	}
	
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(String id) {
		String checkid = service.idCheck(id);
		return checkid;
	}
	
	@PostMapping("/insert")
	public String insert(MemberDto dto) {
		service.insertMem(dto);
		return "redirect:login";
	}
	
	@GetMapping("/snsJoin")
	public String snsJoin() {
		return "snsJoin";
	}
	
}

