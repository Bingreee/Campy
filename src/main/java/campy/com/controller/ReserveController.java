package campy.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import campy.com.dto.CampingDto;
import campy.com.dto.MemberDto;
import campy.com.dto.ReserveDto;
import campy.com.dto.ReviewDto;
import campy.com.service.ReserveService;

@SessionAttributes({"reserve","camping","user"})
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
	
	@ModelAttribute("user")
	public MemberDto memDto() {
		return new MemberDto();
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
	
	@GetMapping("/review")
	public String review(@RequestParam(name="p", defaultValue="1") int page, Model m) {
		
		//글이 있는지 체크
		int countReview = rservice.countReview();
		if(countReview> 0) {
			
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage + 1; //시작 글번호
			int endRow = page * perPage;			//끝 글번호
			
			List<ReviewDto> reviewList = rservice.reviewList(startRow, endRow);
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
			return "review";
	}
	
	@GetMapping("/reviewContent/{rv_no}")
	public String reviewContent(@ModelAttribute("user")MemberDto user, @PathVariable int rv_no, Model m) {
		ReviewDto rdto = rservice.reviewContent(rv_no);
		m.addAttribute("rdto",rdto);
		return "reviewContent";
	}
	
	@GetMapping("reviewWrite")
	public String reviewWrite(@ModelAttribute("user")MemberDto dto) {
		return "reviewWrite";
	}
	
}