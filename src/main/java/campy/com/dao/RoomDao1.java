package campy.com.dao;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.ReserveDto;

@Mapper
public interface RoomDao1 {
	
	int insertReserve(ReserveDto dto);
}
