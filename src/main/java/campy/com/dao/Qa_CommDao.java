package campy.com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.QaDto;
import campy.com.dto.Qa_CommDto;
@Mapper
public interface Qa_CommDao {

	List<Qa_CommDto> selectComm(int qa_no);

	int insertComm(Qa_CommDto dto);

	int deleteComm(int qa_no);



}
