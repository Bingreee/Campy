package campy.com.service;

import java.util.HashMap;
import java.util.Map;

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
	
	public int checkLove(String id, int c_no) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("id", id);
		m.put("c_no", c_no);
		Integer x = dao.checkLove(m);
		System.out.println(x);
		return x;
	}
	
	public int deleteLove(String id, int c_no) {
		Map<String, Object> m =new HashMap<String, Object>();
		m.put("id", id);
		m.put("c_no", c_no);
		int y = dao.deleteLove(m);
		return y;
	}
	
}
