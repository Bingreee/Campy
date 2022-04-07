package campy.com.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import campy.com.dto.QaDto;

@Mapper
public interface QnaDao {

	public List<QaDto> list();
		
		
	int insert(QaDto qdto);

	int updateQna(QaDto qdto);

}
