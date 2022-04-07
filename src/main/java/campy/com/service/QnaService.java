package campy.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.QnaDao;
import campy.com.dto.QaDto;

@Service
public class QnaService {

	@Autowired
	QnaDao qdao;
	
	public int insert(QaDto qdto) {
		return qdao.insert(qdto);
	}
	public int updateQna(QaDto qdto) {
		return qdao.updateQna(qdto);
	}
	
	
	
	
	
	
	
	
	
	
}
