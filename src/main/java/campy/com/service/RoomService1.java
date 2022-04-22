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
	
	public List<ReserveDto> allReserve() {
		return rdao1.allReserve();
	}
	
	public int selCamNO(int c_no) {
		return rdao1.selCamNO(c_no);
	}
	
	public int chkDate(ReserveDto dto) {
		return rdao1.chkDate(dto);
	}
	
	public List<ReserveDto> chkDateList(ReserveDto dto) {
		return rdao1.chkDateList(dto);
	}
	
	public List<ReserveDto> selCalender() {
		return rdao1.selCalender();
	}
}
