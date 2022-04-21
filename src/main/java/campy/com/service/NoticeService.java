package campy.com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.NoticeDao;
import campy.com.dto.NoticeDto;

@Service
public class NoticeService {
	
	@Autowired
	NoticeDao dao;
	
	public List<NoticeDto> noList(int start,int end){
		Map<String, Object> m = new HashMap<String,Object>();
		m.put("start", start);
		m.put("end", end);
		return dao.noList(m);
	}

	public int insert(NoticeDto dto) {
		return dao.insert(dto);
	}
	
	public NoticeDto noticeOne(int no) {
		return dao.noticeOne(no);
	}

	public int count() {
		return dao.count();
	}
	public List<NoticeDto> noticeListSearch(int searchn, String search,int start, int end){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("end", end);
		return dao.noticeListSearch(m);
	}
	public int countSearch(int searchn, String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}
	
	public int updateNotice(NoticeDto dto) {
		return dao.updateNotice(dto);
	}
	public int deleteNotice(int not_no) {
		return dao.deleteNotice(not_no);
	}
	
	
	
	
}