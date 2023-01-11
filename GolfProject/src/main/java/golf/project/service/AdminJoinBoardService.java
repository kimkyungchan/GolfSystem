package golf.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.AdminJoinBoardDao;
import golf.project.dto.AdminJoinBoardDto;

@Service
public class AdminJoinBoardService {
	@Autowired
	AdminJoinBoardDao dao;
	
	public int count() {
		return dao.count();
	}
	
	public List<AdminJoinBoardDto> joinList(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.joinList(m);
	}
	
	public AdminJoinBoardDto joinOne(int no) {
		dao.addReadcount(no);
		return dao.joinOne(no);
	}
	
	public int deleteJoin(int no) {
		return dao.deleteJoin(no);
	}
	
	public List<AdminJoinBoardDto> joinListSearch(int searchn, String search, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.joinListSearch(m);
	}
	
	public int countSearch(int searchn, String search) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}

}
