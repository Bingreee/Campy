package campy.com.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;

import campy.com.dto.QaDto;
import campy.com.dto.Qa_CommDto;

@Mapper
public interface QnaDao {

	//리스트
	List<QaDto> qaList(Map<String, Object> m);
	
	//글쓰기
	int insert(QaDto dto);
	
	//글삭제
	int deleteQa(int qa_no);
	
	//글수정
	int updateQa(QaDto dto);
	
	//전체 글 갯수
	int count();

	QaDto qaOne(int qa_no);

	List<QaDto> qaListSearch(Map<String, Object> m);

	int countSearch(Map<String, Object> m);

	//List<Qa_CommDto> selectComm(int qa_no);



	

}
