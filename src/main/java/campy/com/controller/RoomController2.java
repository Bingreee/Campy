package campy.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import campy.com.dto.CampAndReserveDto;
import campy.com.dto.CampingDto;
import campy.com.dto.MemberDto;
import campy.com.dto.ReserveDto;
import campy.com.dto.RoomDto;
import campy.com.service.LoveService;
import campy.com.service.ReserveService;
import campy.com.service.RoomService1;
import campy.com.service.RoomService2;

@SessionAttributes({"reserve","camping","user"})
@Controller
public class RoomController2 {

	@Autowired
	RoomService2 rservice2;
	@Autowired
	RoomService1 rservice1;
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
	
	@ModelAttribute("user")
	public MemberDto memDto() {
		return new MemberDto();
	}
	
	@ModelAttribute("campList")
	public List<CampingDto> campList(){
		return rservice2.selectC_name();
	}
	
	@ModelAttribute("room")
	public int roomSetter() {
		return 1;
	}

	@RequestMapping("/room")
	public String selectC_name(@ModelAttribute("user") MemberDto dto, Model m) {
		return "/campy/room";
	}
	
	@GetMapping("/room/{c_no}")
	@ResponseBody 
	public String selectRoom(@PathVariable int c_no, @ModelAttribute("user") MemberDto dto) {
		List<RoomDto> r2 = rservice2.selectRoom(c_no);
		
		Gson gson = new Gson();
		String r2_text = gson.toJson(r2);
		return r2_text;
	}
	
	
	  @GetMapping("/campy/roomInfo/{c_no}") 
	  public String roomInfo(@PathVariable int c_no, ReserveDto dto, Model m) { 
		 int room = rservice2.selectRoomNo(c_no);
		 List<ReserveDto> listReserve = rservice1.chkDateList(dto);
		 m.addAttribute("room",room); 
		 m.addAttribute("chkDateList",listReserve);
		 return "/campy/room"; 
	  }
	  
	  @GetMapping("/admin/adminReserve")
	  public String adminReserve(Model m) {
		  List<CampAndReserveDto> g = rservice.adminReserve();
		  m.addAttribute("adminR",g);
		  return "admin/adminReserve";
	  }
	  
}
