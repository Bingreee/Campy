package campy.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.CampingDao;
import campy.com.dto.CampingDto;
import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;


@Service
public class CampingService {
	
	@Autowired
	CampingDao dao;		
	
	public CampingDto mainSearch(CampingDto dto) {
		System.out.println("Service 메서드 접속");
		System.out.println(dao.mainSearch(dto)+"Service메서드 결과");
		return dao.mainSearch(dto);
	}
}
