package campy.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.CampingDao;
import campy.com.dto.CampingDto;


@Service
public class CampingService {
	
	@Autowired
	CampingDao dao;		
	
	public CampingDto mainSearch(CampingDto dto) {
		return dao.mainSearch(dto);
	}
}
