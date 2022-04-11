package campy.com.dao;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.CampingDto;

@Mapper
public interface CampingDao {

	CampingDto mainSearch(CampingDto dto);
}
