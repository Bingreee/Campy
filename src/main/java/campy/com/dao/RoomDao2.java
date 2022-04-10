package campy.com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.CampingDto;
import campy.com.dto.RoomDto;

@Mapper
public interface RoomDao2 {

	int countRoom();
	//List<RoomDto> room(); 전체 객실 정보
	List<CampingDto> selectC_name();
	List<RoomDto> selectRoom(int c_no);
}
