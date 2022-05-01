package campy.com.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;

import campy.com.dto.MemberDto;
import campy.com.service.LoginService;
import oracle.jdbc.proxy.annotation.Post;

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
		return "campyLogin";
	}
	
	@PostMapping("/memLogin")
	public String memLogin (@ModelAttribute("command") @Valid MemberDto dto, BindingResult error, Model m) {
		
		if(error.hasErrors()) {
			return "campyLogin";
		}
		
		MemberDto resultDto = service.memLogin(dto);
		if(resultDto == null) {
			error.reject("nocode", "아이디나 비밀번호가 틀렸습니다.");
			return "campyLogin";
		}else {
			m.addAttribute("user", resultDto);
		}
		return "redirect:/main";
	}

	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/main";
	}
	
	@GetMapping("/roomInfo/logout")
	public String logout2(SessionStatus status) {
		status.setComplete();
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
	
	@GetMapping("/find_Id_Form")
	public String find_Id_Form() {
		return "find_Id_Form";
	}
	
	@RequestMapping("/findId")
	@ResponseBody
	public String findId(String mem_name, String mem_tel) {
		String id = service.find_id(mem_name, mem_tel);
		
		Gson gson = new Gson();
		String jid = gson.toJson(id);
		return jid;
	}
	
	@GetMapping("/find_Pw_Form")
	public String findmemPw() {
		return "find_Pw_Form";
	}
	
	@RequestMapping("/update_Pw_Form")
	public String update_Pw_Form(String id, Model m) {
		m.addAttribute("id", id);
		return "update_Pw_Form";
	}

	@PostMapping("/updatePw")
	public String updatePw(String id, String pw) {
		service.updatePw(id, pw);
		return "campyLogin";
	}
	
	@GetMapping("/adminPage")
	public String adminPage() {
		return "adminPage";
	}
	
	@GetMapping("/")
	public String goToMain() {
		return "redirect:main";
	}
}

		



