package campy.com.dao;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.LoveDto;

@Mapper
public interface LoveDao {
	
	int insertLove(LoveDto dto);
}
