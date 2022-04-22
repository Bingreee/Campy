package campy.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import campy.com.dto.MemberDto;
import campy.com.dto.QaDto;
import campy.com.service.MypageService;

@Controller
@SessionAttributes({ "user", "mypage_pwchecker" })
public class MypageController {
	/*
	 * @RequestMapping("/mypage") public String mypage() { return "/mypage"; }
	 * //CampingController의 매핑과 중복이므로 생략
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

	@RequestMapping("/memUpdateCheck")
	public String memUpdateCheck() {
		return "/memUpdateCheck";
	}//비밀번호 확인

	@RequestMapping("/memUpdate")
	public String memUpdates(@ModelAttribute("user") MemberDto dto) {
		Service.updateMem(dto);
		return "/memUpdate";
	}

	@GetMapping("/memUpdate")
	public String memUpdate(@ModelAttribute("user") MemberDto dto) {
		return "/mypage";
	}

}
