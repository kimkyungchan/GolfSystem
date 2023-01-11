package golf.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.AdminNoticeDao;
import golf.project.dto.AdminNoticeDto;

@Service
public class AdminNoticeService {
	@Autowired
	AdminNoticeDao dao;
	
	public int insert(AdminNoticeDto dto) {
		return dao.insert(dto);
	}
	
	public int count() {
		return dao.count();
	}
	
	public List<AdminNoticeDto> noticeList(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.noticeList(m);
	}
	
	public AdminNoticeDto noticeOne(int no) {
		System.out.println("no"+no);
		dao.addReadcount(no);
		return dao.noticeOne(no);
	}
	
	public int updateNotice(AdminNoticeDto dto) {
		return dao.updateNotice(dto);
	}
	
	public int deleteNotice(int no) {
		return dao.deleteNotice(no);
	}
	
	public List<AdminNoticeDto> noticeListSearch(int searchn, String search, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.noticeListSearch(m);
	}
	
	public int countSearch(int searchn, String search) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}

}
