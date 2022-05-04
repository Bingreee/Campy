package campy.com.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.CampingDao;
import campy.com.dto.CampCreateDto;
import campy.com.dto.CampingDto;
import campy.com.dto.RoomDto;
import campy.com.dto.RoomListDto;
import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Service
public class CampingService {

	@Autowired
	CampingDao dao;

	public List<CampingDto> mainSearch(CampingDto dto) {
		System.out.println("Service 메서드 접속");
		System.out.println(dao.mainSearch(dto) + "Service메서드 결과");
		return dao.mainSearch(dto);
	}

	/*
	 * public int campCreateInfo(CampCreateDto dto) { return
	 * dao.campCreateInfoC(dto); }
	 */

	public void campCreateInfoR1(RoomListDto dto) {
		CampCreateDto cdto = dto.getCdto();
		dao.campCreateInfoC(cdto);
		int c_no = cdto.getC_no();
		//System.out.println(c_no);

		for (int i = 0; i < dto.getRListDto().size(); i++) {
			RoomDto rdto = dto.getRListDto().get(i);
			rdto.setC_no(c_no);
			
			dao.campCreateInfoR1(rdto);
		}

		// return dao.campCreateInfoR1(rdto);
	}

	public int campReviseInfo(CampCreateDto dto) {
		dao.campReviseInfoC(dto);
		dao.campReviseInfoR1(dto);
		dao.campReviseInfoR2(dto);
		return dao.campReviseInfoR3(dto);
	}

	public CampingDto campFinder(int c_no) {

		return dao.campFinder(c_no);
	}

	public List<RoomDto> roomFinder(int c_no) {
		return dao.roomFinder(c_no);
	}

	public int roomFindDelete(int c_no) {
		return dao.roomFindDelete(c_no);

	}

	public int campFindDelete(int c_no) {
		return dao.campFindDelete(c_no);

	}

	public List<CampingDto> campAll() {
		return dao.campAll();
	}
}