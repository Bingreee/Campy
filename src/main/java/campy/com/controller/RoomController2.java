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

import campy.com.dto.CampingDto;
import campy.com.dto.MemberDto;
import campy.com.dto.ReserveDto;
import campy.com.dto.RoomDto;
import campy.com.service.LoveService;
import campy.com.service.RoomService2;

@SessionAttributes({"reserve","camping","user"})
@Controller
public class RoomController2 {

	@Autowired
	RoomService2 rservice2;
	
	
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
	

//	@RequestMapping("/room")
//	public String room(Model m) {
//		List<RoomDto> rlist = rservice2.room();
//		m.addAttribute("room",rlist);
//		return "room";
//	}
	
	@RequestMapping("/room")
	public String selectC_name(@ModelAttribute("user") MemberDto dto, Model m) {
		List<CampingDto> r = rservice2.selectC_name();
		m.addAttribute("campList",r);
		
		
		return "room";
	}
	
	@GetMapping("/room/{c_no}")
	@ResponseBody //view가 따로 없고 room.jsp 그대로 사용할 것
	public String selectRoom(@PathVariable int c_no, @ModelAttribute("user") MemberDto dto) {
		List<RoomDto> r2 = rservice2.selectRoom(c_no);
		
				
		Gson gson = new Gson();
		String r2_text = gson.toJson(r2);
		//System.out.println(r2_text);
		return r2_text;
	}
	
	/*
	 * @GetMapping("/roomInfo/{c_no}") public String roomInfo(@PathVariable int
	 * c_no,Model m) { List<RoomDto> room = rservice2.selectRoom(c_no);
	 * m.addAttribute("room",room); return "roomInfo"; }
	 */
}
