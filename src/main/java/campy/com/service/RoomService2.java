package campy.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.RoomDao2;
import campy.com.dto.RoomDto;

@Service
public class RoomService2 {

	@Autowired
	RoomDao2 rdao2;
	
	public RoomDto selectRoomInfo() {
		return rdao2.selectRoomInfo();
	}
	
	public int countRoom() {
		return rdao2.countRoom();
	}
	
	public List<RoomDto> room(){
		return rdao2.room();
	}
}
