package campy.com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import campy.com.dto.CampAndReserveDto;
import campy.com.dto.ReserveDto;
import campy.com.dto.RoomAndRphoto;

@Mapper
public interface RoomDao1 {
	
	int insertReserve(ReserveDto dto);
	List<RoomAndRphoto> selRoomPho(Map<String,Object> m);
	List<ReserveDto> allReserve();
	int selCamNO(int c_no);
	int chkDate(ReserveDto dto);
	List<ReserveDto> chkDateList(ReserveDto dto);
	List<CampAndReserveDto> selCalender();
	List<ReserveDto> selR_no(int c_no);
}
