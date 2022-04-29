package campy.com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray; //JSON배열 사용
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import campy.com.dto.CampAndReserveDto;
import campy.com.dto.CampingDto;
import campy.com.dto.MemberDto;
import campy.com.dto.ReserveDto;
import campy.com.dto.RoomAndRphoto;
import campy.com.service.ReserveService;
import campy.com.service.RoomService1;
import campy.com.service.RoomService2;

@SessionAttributes({"reserve","camping","user"})
@Controller
public class RoomController1 {
	
	@Autowired
	ReserveService rservice;
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
		List<RoomAndRphoto> listR_pho = rservice1.selRoomPho(c_no, r_no);
		
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

	@RequestMapping("/fullCalenderPage")
	public String fullCalenderPage() {
		return "fullCalenderPage";
	}
	
	@RequestMapping("/fullCalender")
	@ResponseBody
	public List<Map<String, Object>> selCalender() {
		List<CampAndReserveDto> calenderList = rservice1.selCalender();

        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();

        HashMap<String, Object> hash = new HashMap<>();

        for (int i = 0; i < calenderList.size(); i++) {
            hash.put("title", calenderList.get(i).getC_name()+"   "+calenderList.get(i).getMem_name()+"  "+calenderList.get(i).getC_no()+"  "+calenderList.get(i).getR_no());
            hash.put("start", calenderList.get(i).getStart_date());
            hash.put("end", calenderList.get(i).getEnd_date2());

            jsonObj = new JSONObject(hash);
            jsonArr.add(jsonObj);
        } 
        return jsonArr;
	}
	
	@RequestMapping("/chkDate")
	@ResponseBody
	public int chkDate(ReserveDto dto) {
		int i = rservice1.chkDate(dto);
		return i;
	}
	
	
	 @RequestMapping("/chkDateList")
	 @ResponseBody 
	 public String chkDateList(ReserveDto dto) { 
	 List<ReserveDto> list_res = rservice1.chkDateList(dto);
	 Gson gson = new Gson(); 
	 String list_res2 = gson.toJson(list_res); 
	 return list_res2; 
	 }
	 

}
