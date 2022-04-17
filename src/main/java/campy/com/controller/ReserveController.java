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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import campy.com.dto.CampingDto;
import campy.com.dto.MemberDto;
import campy.com.dto.ReserveDto;
import campy.com.dto.ReviewDto;
import campy.com.service.ReserveService;
import campy.com.service.RoomService2;

@SessionAttributes({"reserve","camping","user","review"})
@Controller
public class ReserveController {

	@Autowired
	ReserveService rservice;
	
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

	
	
	 @GetMapping("/reserveStatus")
	 public String reserveStatus(@ModelAttribute("user") MemberDto memberdto, @ModelAttribute("reserve") ReserveDto dto,  Model m) {
		 List<ReserveDto> rStatus = rservice.reserveStatus();
		 m.addAttribute("rStatus",rStatus);
		 return"reserveStatus";
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
		List<CampingDto> r = rservice2.selectC_name();
		m.addAttribute("campList",r);
		
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
	public String reviewContent(@ModelAttribute("user") MemberDto memDto, @ModelAttribute("review") ReviewDto reviewDto, @PathVariable int rv_no, Model m) {
		ReviewDto rdto = rservice.reviewContent(rv_no);
		m.addAttribute("rdto",rdto);
		return "reviewContent";
	}
	
	@GetMapping("reviewWrite")
	public String reviewWriteForm(@ModelAttribute("user")MemberDto memDto, @ModelAttribute("review")ReviewDto reviewDto, @ModelAttribute("camping") CampingDto campDto, Model m) {
		List<CampingDto> r = rservice2.selectC_name();
		m.addAttribute("campList",r);
		return "reviewWrite";
	}
	
	@PostMapping("reviewWrite")
	public String reviewWrite(ReviewDto rv_dto) {
		rservice.reviewWrite(rv_dto);
		return "redirect:review";
	}
	
	@GetMapping("/review/{c_no}")
	@ResponseBody //view가 따로 없고 review.jsp 그대로 사용할 것
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
		return "reviewUpdateForm";
	}
	
	@PutMapping("/review/update")
	public String reviewUpdate(ReviewDto rv_dto) {
		rservice.reviewUpdate(rv_dto);
		return "redirect:/review";
	}
	
	@GetMapping("/review/search")
	public String reviewSearch(int searchn, String search,@RequestParam(name="p", defaultValue = "1") int page,@ModelAttribute("user") MemberDto memDto, Model m) {
		int count = rservice.reviewSearchCount(searchn,search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage + 1;
		int endRow = page * perPage;
		
		List<ReviewDto> reviewList = rservice.reviewSearch(searchn,search,startRow, endRow);
		m.addAttribute("rSearch", reviewList);

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
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
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);
		
		return "review/reviewSearch";
	}

	
	
}