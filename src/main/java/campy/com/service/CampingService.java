package campy.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.CampingDao;
import campy.com.dto.CampCreateDto;
import campy.com.dto.CampingDto;
import campy.com.dto.RoomDto;
import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;


@Service
public class CampingService {
	
	@Autowired
	CampingDao dao;		
	
	public List<CampingDto> mainSearch(CampingDto dto) {
		System.out.println("Service 메서드 접속");
		System.out.println(dao.mainSearch(dto)+"Service메서드 결과");
		return dao.mainSearch(dto);
	}

	public int campCreateInfo(CampCreateDto dto) {
		return dao.campCreateInfoC(dto);
	}
	
	public int campCreateInfoR1(RoomDto dto) {
		return dao.campCreateInfoR1(dto);
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
	
	public List<CampingDto> campAll(){
		return dao.campAll();
	}
}
