package campy.com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.RoomDto;

@Mapper
public interface RoomDao2 {

	int countRoom();
	List<RoomDto> room();
}
