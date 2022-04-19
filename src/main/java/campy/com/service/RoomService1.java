package campy.com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.RoomDao1;
import campy.com.dto.R_PhotoDto;
import campy.com.dto.ReserveDto;

@Service
public class RoomService1 {
	
	@Autowired
	RoomDao1 rdao1;
	
	public int insertReserve(ReserveDto dto) {
		return rdao1.insertReserve(dto);
	}
	
	public List<R_PhotoDto> selRoomPho(int c_no, int r_no) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("c_no", c_no);
		m.put("r_no", r_no);
		return rdao1.selRoomPho(m);
	}

}
