package campy.com.service;



import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.LoginDao;
import campy.com.dto.MemberDto;

@Service
public class LoginService {
	
	@Autowired
	LoginDao dao;
	
	public MemberDto memLogin(MemberDto dto) {
		return dao.memLogin(dto);
	}
	public int insertMem(MemberDto dto) {
		return dao.insertMem(dto);
	}
	public String idCheck(String id) {
		return dao.idCheck(id);
	}
	public String find_id(String mem_name, String mem_tel) {
		Map<String, Object> m = new HashMap<>();
		m.put("mem_name", mem_name);
		m.put("mem_tel", mem_tel);
		return dao.findId(m);
	}
	public int updatePw(String id, String pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw",pw);
		return dao.updatePw(map);
	}
	

}
