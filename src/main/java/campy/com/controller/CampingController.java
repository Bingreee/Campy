package campy.com.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import campy.com.dto.CampCreateDto;
import campy.com.dto.CampingDto;
import campy.com.dto.MemberDto;
import campy.com.dto.ReserveDto;
import campy.com.dto.RoomDto;
import campy.com.dto.RoomListDto;
import campy.com.service.CampingService;
import campy.com.service.RoomService2;

@SessionAttributes({"user","mainSearchInfoResult"})
@Controller
public class CampingController {
	
	@Autowired
	CampingService service;
	
	@Autowired
	RoomService2 rservice2;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}
	
	@ModelAttribute("mainSearchInfoResult")
	public List<CampingDto> getCampingDto() {
		return null;
	}
	
	
	@ModelAttribute("mainSelectC_no")
	public int getMainSelectC_no() {
		return 0;
	}
	
	@ModelAttribute("campList")
	public List<CampingDto> campList(){
		return rservice2.selectC_name();
	}

	
	@RequestMapping("/login/join")
	public String join() {
			return "/login/join";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "/mypage/mypage";
	}
	
	@RequestMapping("/mainToRoom")
	public String mainToRoom(@ModelAttribute("mainSelectC_no") int a, Model m) {
		m.addAttribute("roomC_no", a);
		return "/campy/room";
	}
	
	@GetMapping("/main/mainSearch")
	@ResponseBody						
	public List<CampingDto> mainSearch(CampingDto dto, Model m) {
		List<CampingDto> mainSearchInfoResult=service.mainSearch(dto);
		m.addAttribute("mainSearchInfoResult", mainSearchInfoResult);
		return mainSearchInfoResult;
	}
	
	@RequestMapping("/admin/campCreate")
	public String campCreate() {
		return "/admin/campCreate";
	}
	
	@RequestMapping("/admin/campShowAll")
	public String campShowAll(Model m) {
		List<CampingDto> campAll = service.campAll();
		m.addAttribute("campList",campAll);
		return "/admin/campShowAll";
	}
	
	@RequestMapping("/admin/campRevise/{c_no}")
	public String campRevise(@PathVariable int c_no, Model m) {
		CampingDto ReviseCamp = service.campFinder(c_no);
		m.addAttribute("ReviseCamp", ReviseCamp);
		
		List<RoomDto> ReviseRoom = service.roomFinder(c_no);
		m.addAttribute("ReviseRoom", ReviseRoom);
	
		return "/admin/campRevise";
	}
	
	@RequestMapping("/campDelete/{c_no}")
	@ResponseBody
	public String campDelete(@PathVariable int c_no, Model m){
		service.roomFindDelete(c_no);
		int j = service.campFindDelete(c_no);
		return ""+j;
	}
	
	@RequestMapping("/admin/campReviseInfo")
	public String campReviseInfo(CampCreateDto dto) {
		return "/admin/campShowAll";
	}

	@RequestMapping("admin/createRoom")
	public String CreateRoom(Model m, @ModelAttribute("rLDto")RoomListDto rListDto) {
		System.out.println(rListDto);
		service.campCreateInfoR1(rListDto);
		return "redirect:/admin/campShowAll";
	}
	
		
	@GetMapping("/campy/main")
	public String campAll(Model m){
		List<CampingDto> c= service.campAll();
		m.addAttribute("campAll",c);
		return "/campy/main";
	}
}