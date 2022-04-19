package campy.com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.ReserveDao;
import campy.com.dto.CampAndReserveDto;
import campy.com.dto.ReserveDto;
import campy.com.dto.ReviewDto;

@Service
public class ReserveService {

	@Autowired
	ReserveDao rdao;
	
	public List<CampAndReserveDto> reserveStatus(String id) {
		return rdao.reserveStatus(id);
	}
	
	public CampAndReserveDto reserveDetail(int reserve_no) {
		return rdao.reserveDetail(reserve_no);
	}
	
	public int deleteReserve(ReserveDto dto) {
		return rdao.deleteReserve(dto);
	}
	
	public int countReview() {
		return rdao.countReview();
	}
	
	public List<ReviewDto> reviewList(int start, int end) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		return rdao.reviewList(m);
	}
	
	public ReviewDto reviewContent(int rv_no) {
		return rdao.reviewContent(rv_no);
	}
	
	
	 public int reviewWrite(ReviewDto rv_dto) { 
		 return rdao.reviewWrite(rv_dto); 
	 }
	 
	
	public List<ReviewDto> reviewOne(int c_no) {
		return rdao.reviewOne(c_no);
	}
	
	public int reviewDelete(int rv_no) {
		return rdao.reviewDelete(rv_no);
	}
	
	public int reviewUpdate(ReviewDto rv_dto) {
		return rdao.reviewUpdate(rv_dto);
	}
	
	public int reviewSearchCount(int searchn, String search) {
		System.out.println(searchn+search);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		return rdao.reviewSearchCount(m);
	}
	
	public List<ReviewDto> reviewSearch(int searchn, String search, int start, int end){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("end", end);
		
		return rdao.reviewSearch(m);
	}
}
