package campy.com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.CampAndReserveDto;
import campy.com.dto.R_PhotoDto;
import campy.com.dto.ReserveDto;

@Mapper
public interface RoomDao1 {
	
	int insertReserve(ReserveDto dto);
	List<R_PhotoDto> selRoomPho(Map<String,Object> m);
	List<ReserveDto> allReserve();
	int selCamNO(int c_no);
	int chkDate(ReserveDto dto);
	List<ReserveDto> chkDateList(ReserveDto dto);
	List<CampAndReserveDto> selCalender();
}
