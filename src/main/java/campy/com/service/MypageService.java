package campy.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.MypageDao;
import campy.com.dto.MemberDto;
import campy.com.dto.QaDto;

@Service
public class MypageService {

	@Autowired
	MypageDao mdao;
	
	public int updateMem(MemberDto dto) {
		return mdao.updateMem(dto);
	}
	public int deleteMem(int id) {
		return mdao.deleteMem(id);
	}

	
}
