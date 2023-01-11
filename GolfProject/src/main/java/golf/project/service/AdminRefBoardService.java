package golf.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.AdminRefBoardDao;
import golf.project.dto.AdminRefBoardDto;

@Service
public class AdminRefBoardService {
	@Autowired
	AdminRefBoardDao dao;
	
public void insert(AdminRefBoardDto dto) {
		
		if(dto.getRef() == 0 ) { 
			dao.insert(dto);
				
			dao.updateRef(dto.getNo());
		}else { 
			dao.updateStep(dto);
			dto.setRe_step(dto.getRe_step()+1);
			dto.setRe_level(dto.getRe_level()+1);
			dao.insert(dto);
		}
	}
	
	public int count() {
		return dao.count();
	}
	
	public List<AdminRefBoardDto> refList(int start, int perPage){
		Map<String, Object> m = new HashMap<>();
		m.put("start", start);
		m.put("count", perPage);
		return dao.refList(m);
	}
	
	
	public AdminRefBoardDto refOne(int no) {
		dao.addReadcount(no);
		return dao.refOne(no);
	}
	
	public int deleteRef(int no) {
		return dao.deleteRef(no);
	}
	

	
	public List<AdminRefBoardDto> refListSearch(int searchn, String search, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.refListSearch(m);
	}
	
	public int countSearch(int searchn, String search) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}
}
