package campy.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.ReserveDao;
import campy.com.dto.ReserveDto;

@Service
public class ReserveService {

	@Autowired
	ReserveDao rdao;
	
	public ReserveDto reserveStatus() {
		return rdao.reserveStatus();
	}
	
	
	public int deleteReserve(ReserveDto dto) {
		return rdao.deleteReserve(dto);
	}
}
