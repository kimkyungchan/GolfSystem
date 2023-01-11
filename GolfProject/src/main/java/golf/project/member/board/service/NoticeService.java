package golf.project.member.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.member.board.dao.NoticeCilentDao;
import golf.project.member.board.dto.NoticeDto;

@Service("notice2Service")
public class NoticeService {
	@Autowired
	NoticeCilentDao dao;
	
	public int count() {
		return dao.count();
	}
	public List<NoticeDto> noticeList(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.noticeList(m);
	}

	public NoticeDto noticeOne(int no) {
		System.out.println("client no"+no);
		dao.addReadcount(no);
		return dao.noticeOne(no);
	}

	public List<NoticeDto> noticeListSearch(int searchn, String search, int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search",search);
		m.put("start",start);
		m.put("count",10);
		return dao.noticeListSearch(m);
	}
	public int countSearch(int searchn, String search) {
		//System.out.println(searchn+search);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search",search);
		return dao.countSearch(m);
	}
}
