package campy.com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.R_PhotoDto;
import campy.com.dto.ReserveDto;

@Mapper
public interface RoomDao1 {
	
	int insertReserve(ReserveDto dto);
	List<R_PhotoDto> selRoomPho(Map<String,Object> m);
}
