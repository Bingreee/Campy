package campy.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.Qa_CommDao;
import campy.com.dto.QaDto;
import campy.com.dto.Qa_CommDto;

@Service
public class Qa_CommService {

	@Autowired
	Qa_CommDao cdao;
	
	public List<Qa_CommDto> selectComm(int qa_no){
		return cdao.selectComm(qa_no);
	}
	public int insertComm(Qa_CommDto dto) {
		return cdao.insertComm(dto);
	}
	public int deleteComm(int qa_comm) {
		return cdao.deleteComm(qa_comm);
	}

}
