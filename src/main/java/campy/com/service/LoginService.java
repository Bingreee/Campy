package campy.com.service;



import java.io.PrintWriter;
import java.util.HashMap;

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
	public String find_id(HttpServletResponse response, String mem_tel) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.findId(mem_tel);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	public int updatePw(String id, String pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw",pw);
		return dao.updatePw(map);
	}

}
