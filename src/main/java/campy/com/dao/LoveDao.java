package campy.com.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.LoveDto;

@Mapper
public interface LoveDao {
	
	int insertLove(LoveDto dto);
	int checkLove(Map<String, Object> m);
	int deleteLove(Map<String, Object> m);
}
