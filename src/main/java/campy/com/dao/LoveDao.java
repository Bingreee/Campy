package campy.com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.CampingAndLoveDto;
import campy.com.dto.LoveDto;

@Mapper
public interface LoveDao {
	
	int insertLove(LoveDto dto);
	int checkLove(Map<String, Object> m);
	List<CampingAndLoveDto> LoveList(String id);
	int deleteLove(CampingAndLoveDto cAldto);
	int deleteLoveRoom(Map<String, Object> m);
}
