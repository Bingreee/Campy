package campy.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.RoomDao1;
import campy.com.dto.ReserveDto;

@Service
public class RoomService1 {
	
	@Autowired
	RoomDao1 rdao1;
	
	public int insertReserve(ReserveDto dto) {
		return rdao1.insertReserve(dto);
	}
}
