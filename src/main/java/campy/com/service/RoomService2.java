package campy.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.RoomDao2;
import campy.com.dto.CampingDto;
import campy.com.dto.RoomDto;

@Service
public class RoomService2 {

	@Autowired
	RoomDao2 rdao2;
	
	public int countRoom() {
		return rdao2.countRoom();
	}
	
//	public List<RoomDto> room(){
//		return rdao2.room();
//	}
	
	public List<CampingDto> selectC_name(){
		return rdao2.selectC_name();
	}
	
	public List<RoomDto> selectRoom(int c_no){
		return rdao2.selectRoom(c_no);
	}
	
	public int selectRoomNo(int c_no) {
		return rdao2.selectRoomNo(c_no);
	}
}
