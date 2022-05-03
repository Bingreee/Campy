package campy.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import campy.com.dto.CampingAndLoveDto;
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
	
	@Autowired
	LoveService lservice;
	
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
	public String insertLove(@ModelAttribute("user") MemberDto memberdto, @ModelAttribute("love") LoveDto dto) {
		dto.setId(memberdto.getId());
		service.insertLove(dto);
		return "room";
	}
	@RequestMapping("/checkLove")
	@ResponseBody
	public String checkLove(@ModelAttribute("user") MemberDto memberdto, int c_no) {
		int x = lservice.checkLove(memberdto.getId(),c_no);
		return x+"";
	}
	
	@GetMapping("/memLove")
	public String LoveList(@ModelAttribute("user") MemberDto memberdto,Model m) {
		List<CampingAndLoveDto> loveStatus= lservice.checkLove(memberdto.getId());
		//System.out.println("loveStatus : "+loveStatus);
		m.addAttribute("loveStatus",loveStatus);
		return "memLove";
	}
	
	
	
	@RequestMapping("/deleteLoveRoom")
	@ResponseBody
	public String deleteLove(@ModelAttribute("user") MemberDto memberdto, int c_no) {
	int y = service.deleteLoveRoom(memberdto.getId(), c_no);
		return y+"";
	}
	
	@RequestMapping("/deleteLove")
	@ResponseBody
	public String deleteLove(CampingAndLoveDto cAldto) {
		int i = lservice.deleteLove(cAldto);
		return ""+i;
	}
	
}
