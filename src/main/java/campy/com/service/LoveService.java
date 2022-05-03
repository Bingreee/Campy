package campy.com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.LoveDao;
import campy.com.dto.CampingAndLoveDto;
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
	
	public List<CampingAndLoveDto> checkLove(String id) {
		return dao.LoveList(id);
	}
	
	public int deleteLoveRoom(String id, int c_no) {
		Map<String, Object> m =new HashMap<String, Object>();
		m.put("id", id);
		m.put("c_no", c_no);
		int y = dao.deleteLoveRoom(m);
		return y;
	}
	
	public int deleteLove(CampingAndLoveDto cAldto) {
		return dao.deleteLove(cAldto);
	}
	
}
