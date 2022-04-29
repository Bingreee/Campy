package campy.com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.CampCreateDto;
import campy.com.dto.CampingDto;

@Mapper
public interface CampingDao {

	List<CampingDto> mainSearch(CampingDto dto);

	int campCreateInfoC(CampCreateDto dto);
	int campCreateInfoR1(CampCreateDto dto);
	int campCreateInfoR2(CampCreateDto dto);
	int campCreateInfoR3(CampCreateDto dto);

	int campReviseInfoC(CampCreateDto dto);
	int campReviseInfoR1(CampCreateDto dto);
	int campReviseInfoR2(CampCreateDto dto);
	int campReviseInfoR3(CampCreateDto dto);

	CampingDto campFinder(int c_no);

	List<campy.com.dto.RoomDto> roomFinder(int c_no);

	int roomFindDelete(int c_no);

	int campFindDelete(int c_no);
}
