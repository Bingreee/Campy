package campy.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import campy.com.dto.CampingDto;
import campy.com.dto.MemberDto;
import campy.com.dto.ReserveDto;
import campy.com.service.RoomService1;

@SessionAttributes({"reserve","camping","user"})
@Controller
public class RoomController1 {
	
	@Autowired
	RoomService1 rservice1;
	
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
	
	@RequestMapping("/insertReserve")
	public String insertReserve(@ModelAttribute("user") MemberDto memberdto, ReserveDto dto) {
		
		dto.setId(memberdto.getId());
		dto.setMem_name(memberdto.getMem_name());
		dto.setMem_tel(memberdto.getMem_tel());
		System.out.println(dto);
		rservice1.insertReserve(dto);
		return "reserveStatus";
	}
}
