package campy.com.dao;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.RoomDto;

@Mapper
public interface RoomDao2 {

	RoomDto selectRoomInfo();
}
