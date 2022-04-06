package campy.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import campy.com.dto.CampingDto;
import campy.com.dto.ReserveDto;
import campy.com.service.ReserveService;

@SessionAttributes({"reserve","camping"})
@Controller
public class ReserveController {

	@Autowired
	ReserveService rservice;

	@ModelAttribute("reserve")
	public ReserveDto reserveDto() {
		return new ReserveDto();
	}
	
	@ModelAttribute("camping")
	public CampingDto campDto() {
		return new CampingDto();
	}

	
	@GetMapping("/reserveStatus")
	public String reserveStatus(@ModelAttribute("reserve") ReserveDto dto) { 
		return "reserveStatus"; 
	}
	 
	
	@GetMapping("/reserveDetail")
	public String getReserve(ReserveDto dto) {
		return "reserveDetail";
	}
	
	@DeleteMapping("/deleteReserve")
	public String deleteReserve(ReserveDto dto) {
		return "redirect:reserveStatus";
	}
}