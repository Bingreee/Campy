package campy.com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.NoticeDto;

@Mapper
public interface NoticeDao {

	List<NoticeDto> noList(Map<String,Object> m);

	int insert(NoticeDto dto);

	NoticeDto noticeOne(int no);

	int count();

	List<NoticeDto> noticeListSearch(Map<String, Object> m);

	int countSearch(Map<String, Object> m);

	int updateNotice(NoticeDto dto);

	int deleteNotice(int not_no);

}
