package campy.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import campy.com.dto.CampingDto;
import campy.com.dto.LoveDto;
import campy.com.dto.MemberDto;
import campy.com.dto.ReserveDto;
import campy.com.service.LoveService;

@SessionAttributes({"reserve","camping","user"})
@Controller
public class LoveController {
	
	@Autowired
	LoveService service;
	
	@ModelAttribute("reserve")
	public ReserveDto reserveDto() {
		return new ReserveDto();
	}
	
	@ModelAttribute("camping")
	public CampingDto campDto() {
		return new CampingDto();
	}
	
	@ModelAttribute("user")
	public MemberDto memDto() {
		return new MemberDto();
	}
	
	@RequestMapping("/insertLove")
	public String insertLove(@ModelAttribute("user") MemberDto memberdto, LoveDto dto) {
		dto.setId(memberdto.getId());
		service.insertLove(dto);
		return "room";
	}
}
