package campy.com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import campy.com.dao.QnaDao;
import campy.com.dto.QaDto;
import campy.com.dto.Qa_CommDto;

// @Controller,@Service,@Repository,@Component,@RestController -> (root),servlet-context.xml에 scan패키지 안쪽에 존재
@Service
public class QnaService {

	@Autowired
	QnaDao qdao;
	

	public List<QaDto> qaList(int start,int end){
		Map<String, Object> m = new HashMap<String,Object>();
		m.put("start", start);
		m.put("end", end);
		return qdao.qaList(m);
	}
	public int count() {
		return qdao.count();
	}
	
	public int insert(QaDto dto) {
		return qdao.insert(dto);
	}

	public int deleteQa(int no) {
		return qdao.deleteQa(no);
	}
	
	public int updateQa(QaDto dto) {
		return qdao.updateQa(dto);
	}
	public QaDto qaOne(int no) {
		return qdao.qaOne(no);
	}
	public List<QaDto> qaListSearch(int searchn2, String searchn,int start,int end){
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("searchn", searchn);
		m.put("search", searchn2);
		m.put("start", start);
		m.put("end", end);		
		return qdao.qaListSearch(m);
	}
	public int countSearch(int searchn,String search) {
		System.out.println(searchn+search);
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return qdao.countSearch(m);
	}
	public List<Qa_CommDto> selectComm(int no) {
		
		return qdao.selectComm(no);
	}
	
	
	
	
}
