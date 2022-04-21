package campy.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.CampingDao;
import campy.com.dto.CampingDto;
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

	public int campCreateInfo(CampingDto dto) {
		System.out.println("campCreateInfo 서비스 메서드 접속");
		return dao.campCreateInfo(dto);
		
	}
}
