package campy.com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.CampingDto;

@Mapper
public interface CampingDao {

	List<CampingDto> mainSearch(CampingDto dto);
}
