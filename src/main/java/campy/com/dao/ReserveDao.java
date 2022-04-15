package campy.com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.ReserveDto;
import campy.com.dto.ReviewDto;

@Mapper
public interface ReserveDao {

	ReserveDto reserveStatus();
	int deleteReserve(ReserveDto dto);
	int countReview(); //리뷰 개수
	List<ReviewDto> reviewList(Map<String, Object>m); //리뷰 리스트
	ReviewDto reviewContent(int rv_no); //리뷰 내용 확인
	int reviewWrite(ReviewDto rv_dto); //리뷰 작성
	List<ReviewDto> reviewOne(int c_no); //캠핑장 마다의 리뷰
	int reviewDelete(int rv_no);//리뷰 삭제
	int reviewUpdate(ReviewDto rv_dto);//리뷰 수정
}
