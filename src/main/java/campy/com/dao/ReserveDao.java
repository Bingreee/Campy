package campy.com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.CampAndReserveDto;
import campy.com.dto.ReserveDto;
import campy.com.dto.ReviewDto;

@Mapper
public interface ReserveDao {

	List<CampAndReserveDto> reserveStatus();//예약 현황
	int deleteReserve(ReserveDto dto);
	int countReview(); //리뷰 개수
	List<ReviewDto> reviewList(Map<String, Object>m); //리뷰 리스트
	ReviewDto reviewContent(int rv_no); //리뷰 내용 확인
	int reviewWrite(ReviewDto rv_dto); //리뷰 작성
	List<ReviewDto> reviewOne(int c_no); //캠핑장 마다의 리뷰
	int reviewDelete(int rv_no);//리뷰 삭제
	int reviewUpdate(ReviewDto rv_dto);//리뷰 수정
	int reviewSearchCount(Map<String, Object> m);//검색 글 개수
	List<ReviewDto> reviewSearch(Map<String, Object> m);//리뷰 검색 리스트
}
