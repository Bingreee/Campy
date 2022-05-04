package campy.com.controller;

import java.util.List;

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
	
	
//	@RequestMapping("/main")
//	public String main(@ModelAttribute("mainSearchInfoResult") CampingDto dto) {
//		return "/main";
//	}
	
	
	@RequestMapping("/join")
	public String join() {
			return "/join";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "/mypage";
	}
	
	@RequestMapping("/mainToRoom")
	public String mainToRoom(@ModelAttribute("mainSelectC_no") int a, Model m) {
		m.addAttribute("roomC_no", a);
		System.out.println("roomC_no");
		return "/room";
	}
	
	@GetMapping("/mainSearch")
	@ResponseBody						//
	public List<CampingDto> mainSearch(CampingDto dto, Model m) {
		System.out.println("mainSearch 들어왔음");
		System.out.println(dto);
		List<CampingDto> mainSearchInfoResult=service.mainSearch(dto);
		m.addAttribute("mainSearchInfoResult", mainSearchInfoResult);
		System.out.println(mainSearchInfoResult+"mainSearch메서드 In Controller");
		return mainSearchInfoResult;
	}
	
	@RequestMapping("/campCreate")
	public String campCreate() {
		return "/campCreate";
	}
	
	@RequestMapping("/campShowAll")
	public String campShowAll() {
		return "campShowAll";
	}
	
	@RequestMapping("/campRevise/{c_no}")
	public String campRevise(@PathVariable int c_no, Model m) {
		CampingDto ReviseCamp = service.campFinder(c_no);
		m.addAttribute("ReviseCamp", ReviseCamp);
		
		List<RoomDto> ReviseRoom = service.roomFinder(c_no);
		m.addAttribute("ReviseRoom", ReviseRoom);
	
		return "/campRevise";
	}
	
	@RequestMapping("/campDelete/{c_no}")
	public String campDelete(@PathVariable int c_no, Model m) {
		service.roomFindDelete(c_no);
		service.campFindDelete(c_no);
		
	
		return "/campRevise";
	}
	
	@RequestMapping("/campReviseInfo")
	public String campReviseInfo(CampCreateDto dto) {
		System.out.println("campReviseInfo 진입");
		System.out.println(dto);
		System.out.println(service.campReviseInfo(dto));
		return "/main";
	}
	
	@RequestMapping("/campCreateInfo")
	public String campCreateInfo(CampCreateDto dto) {
		service.campCreateInfo(dto);
		return "/main";
	}
	
	@RequestMapping("/roomCreateInfo")
	@ResponseBody
	public int campCreateInfoR1(RoomDto dto) {
		int i = service.campCreateInfoR1(dto);
		return i;
	}
	
	@ModelAttribute("campList")
	public List<CampingDto> campList(){
		return rservice2.selectC_name();
	}
	
	@GetMapping("/main")
	public String campAll(Model m){
		List<CampingDto> c= service.campAll();
		m.addAttribute("campAll",c);
		return "/main";
	}
}
