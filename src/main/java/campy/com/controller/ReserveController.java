package campy.com.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import campy.com.dto.CampAndReserveDto;
import campy.com.dto.CampingDto;
import campy.com.dto.MemberDto;
import campy.com.dto.ReserveAndReviewDto;
import campy.com.dto.ReserveDto;
import campy.com.dto.ReviewDto;
import campy.com.service.ReserveService;
import campy.com.service.RoomService1;
import campy.com.service.RoomService2;

@SessionAttributes({"reserve","camping","user","review","cAr"})
@Controller
public class ReserveController {

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
	
	@ModelAttribute("review")
	public ReviewDto reviewDto() {
		return new ReviewDto();
	}

	@ModelAttribute("cAr")
	public CampAndReserveDto cArDto() {
		return new CampAndReserveDto();
	}
		
	 @GetMapping("/reserve/reserveStatus")
	 public String reserveStatus(@RequestParam(name="p", defaultValue="1") int page,@ModelAttribute("user") MemberDto dto, Model m) {
		 
		 int countReserve = rservice.countReserve(dto.getId());
			if(countReserve> 0) {
				
				int perPage = 5; 
				int startRow = (page - 1) * perPage + 1; 
				int endRow = page * perPage;			
				
				List<CampAndReserveDto> reserveList = rservice.reserveList(startRow, endRow,dto.getId());
				m.addAttribute("reserveList",reserveList);
				
				int pageNum = 5;
				int totalPages = countReserve / perPage + (countReserve % perPage > 0 ? 1 : 0); 
				
				int begin = (page - 1) / pageNum * pageNum + 1;
				int end = begin + pageNum -1;
				if(end > totalPages) {
					end = totalPages;
				}
				 m.addAttribute("begin", begin);
				 m.addAttribute("end", end);
				 m.addAttribute("pageNum", pageNum);
				 m.addAttribute("totalPages", totalPages);
			}
				m.addAttribute("countReserve",countReserve);
		 return "/reserve/reserveStatus";
	}
	 
	@GetMapping("/reserve/reserveDetail/{reserve_no}")
	public String reserveDetail(@PathVariable int reserve_no,Model m) {
		CampAndReserveDto rStatus = rservice.reserveDetail(reserve_no);
		m.addAttribute("rStatus",rStatus);
		return "/reserve/reserveDetail";
	}
	
	@DeleteMapping("/reserve/deleteReserve")
	@ResponseBody
	public String deleteReserve(ReserveDto dto) {
		int i = rservice.deleteReserve(dto);
		return ""+i;
	}
	
	@GetMapping("/reserve/allReserve")
	public String adminReserve(Model m) {
		List<CampAndReserveDto> adminR = rservice.adminReserve();
		m.addAttribute("adminR",adminR);
		return "adminReserve";
	}
	
	
	@GetMapping("/review/reviewInfo/{c_no}")
	 public String reviewList(@RequestParam(name="p", defaultValue="1") int page,@PathVariable int c_no, Model m) { 
		int review = rservice1.selCamNO(c_no);
		 m.addAttribute("review",review); 
		String c_name = rservice2.selectC_nameOne(c_no);
		m.addAttribute("campName",c_name);
		List<ReviewDto> reviewOne = rservice.reviewOne(c_no);
		m.addAttribute("reviewOne",reviewOne);
		Long rate = rservice.avgRate(c_no);
		m.addAttribute("rate",rate);
		
		int countReview = rservice.countReview(c_no);
		if(countReview> 0) {
			
			int perPage = 10; 
			int startRow = (page - 1) * perPage + 1; 
			int endRow = page * perPage;			
			
			List<ReviewDto> reviewList = rservice.reviewList(startRow, endRow,c_no);
			m.addAttribute("reviewList",reviewList);
			
			int pageNum = 5;
			int totalPages = countReview / perPage + (countReview % perPage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			 m.addAttribute("begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
		}
			m.addAttribute("countReview",countReview);
			return "/review/review";
		}
	
	@GetMapping("/review/reviewContent/{rv_no}")
	public String reviewContent(@PathVariable int rv_no, Model m) {
		ReviewDto reviewDto = rservice.reviewContent(rv_no);
		System.out.println(reviewDto);
		m.addAttribute("rdto",reviewDto);
		return "/review/reviewContent";
	}
	
	
	@GetMapping("/review/reviewWrite/{c_no}")
	public String reviewWriteForm2(HttpServletResponse response,@PathVariable int c_no,int reserve_no,Model m)throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int chkReserve = rservice.chkReserve(reserve_no);
		
		System.out.println("chkReserve : "+chkReserve);
		if(chkReserve == 0) {
			String r = rservice2.selectC_nameOne(c_no);
			m.addAttribute("campName",r);
			int gg = rservice1.selCamNO(c_no);
			m.addAttribute("gg",gg);
			m.addAttribute("reserve_no",reserve_no);
			return "/review/reviewWrite";
		}else {
			out.println("<script>");
			out.println("alert('이미 작성한 리뷰가 있습니다');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}
	}

	@PostMapping("/review/reviewWrite")
	public String reviewWrite(ReviewDto rv_dto) {
		rservice.reviewWrite(rv_dto);
		int c_no = rv_dto.getC_no();
		return "redirect:/review/reviewInfo/"+c_no;
	}
	
	@GetMapping("/review/review/{c_no}")
	@ResponseBody 
	public String reviewOne(@PathVariable int c_no) {
		List<ReviewDto> rr = rservice.reviewOne(c_no);
		
		Gson gson = new Gson();
		String rr_text = gson.toJson(rr);
		System.out.println(rr_text);
		return rr_text;
	}
	
	@DeleteMapping("/review/delete")
	@ResponseBody
	public String reviewDelete(int rv_no) {
		int i = rservice.reviewDelete(rv_no);
		return ""+i;
	}
	
	@GetMapping("/review/update/{rv_no}")
	public String reviewUpdateForm(@PathVariable int rv_no, Model m) {
		ReviewDto rv_dto = rservice.reviewContent(rv_no);
		m.addAttribute("rv_dto",rv_dto);
		return "/review/reviewUpdateForm";
	}
	
	@PutMapping("/review/updateForm")
	public String reviewUpdate(ReviewDto rv_dto) {
		System.out.println(rv_dto);
		rservice.reviewUpdate(rv_dto);
		System.out.println(rservice.reviewUpdate(rv_dto));
		int c_no = rv_dto.getC_no();
		return "redirect:/review/reviewInfo/"+c_no;
	}

	
	
}