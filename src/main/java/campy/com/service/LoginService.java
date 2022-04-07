package campy.com.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.LoginDao;
import campy.com.dto.MemberDto;

@Service
public class LoginService {
	
	@Autowired
	LoginDao dao;
	
	public MemberDto login(MemberDto dto) {
		return dao.memLogin(dto);
	}
	public int insertMem(MemberDto dto) {
		return dao.insertMem(dto);
	}
	public String idCheck(String id) {
		return dao.idCheck(id);
	}
}
