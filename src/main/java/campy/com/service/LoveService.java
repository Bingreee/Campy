package campy.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.LoveDao;
import campy.com.dto.LoveDto;

@Service
public class LoveService {
	
	@Autowired
	LoveDao dao;
	
	public int insertLove(LoveDto dto) {
		return dao.insertLove(dto);
	}
	
}
