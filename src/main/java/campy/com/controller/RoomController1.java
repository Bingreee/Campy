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
import campy.com.dto.R_PhotoDto;
import campy.com.dto.ReserveDto;
import campy.com.service.RoomService1;
import campy.com.service.RoomService2;

@SessionAttributes({"reserve","camping","user"})
@Controller
public class RoomController1 {
	
	@Autowired
	RoomService1 rservice1;
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
	
	@ModelAttribute("campList")
	public List<CampingDto> campList(){
		return rservice2.selectC_name();
	}
	
	@RequestMapping("/insertReserve")
	public String insertReserve(@ModelAttribute("user") MemberDto memberdto, ReserveDto dto) {
		
		dto.setId(memberdto.getId());
		dto.setMem_name(memberdto.getMem_name());
		dto.setMem_tel(memberdto.getMem_tel());
		//System.out.println(dto);
		rservice1.insertReserve(dto);
		return "reserveStatus";
	}
	
	@RequestMapping("/selRoomPho")
	@ResponseBody
	public String selRoomPho(int c_no, int r_no) {
		List<R_PhotoDto> listR_pho = rservice1.selRoomPho(c_no, r_no);
		
		Gson gson = new Gson();
		String r_pho = gson.toJson(listR_pho);
		//System.out.println(r_pho);
		return r_pho;
	}
	
	@RequestMapping("/allReserve")
	@ResponseBody
	public String allReserve() {
		List<ReserveDto> ListAllReserve = rservice1.allReserve();
		
		Gson gson = new Gson();
		String list_all = gson.toJson(ListAllReserve);
		return list_all;
	}
	
	@GetMapping("reviewInfo/{c_no}")
	 public String selCamNO(@PathVariable int c_no,Model m) { 
		 int review = rservice1.selCamNO(c_no);
		 m.addAttribute("review",review); 
		 return "review"; 
	  }
}
