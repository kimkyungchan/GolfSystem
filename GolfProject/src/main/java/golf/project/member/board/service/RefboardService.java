package golf.project.member.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.member.board.dao.RefboardDao;
import golf.project.member.board.dto.RefboardDto;

@Service
public class RefboardService {
	@Autowired
	RefboardDao dao;
	
	public void insert(RefboardDto dto) {
		
		if(dto.getRef() == 0 ) { // 제목글
			dao.insert(dto);
			//System.out.println("no :: "+dto.getNo());
			dao.updateRef(dto.getNo());
		}else { //답글
			dao.updateStep(dto);
			dto.setRe_step(dto.getRe_step()+1);
			dto.setRe_level(dto.getRe_level()+1);
			dao.insert(dto);
		}	
	}
		
	public int count() {
		return dao.count();
	}
			
	public List<RefboardDto> selectList(int start){
		Map<String, Object> m = new HashMap<>();
		m.put("start", start);
		m.put("count", 10);
		return dao.selectList(m);
	}
			
	public RefboardDto selectOne(int no) {
		dao.updateReadcount(no);
		return dao.selectOne(no);
	}
	public List<RefboardDto> refboardListSearch(int searchn, String search, int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search",search);
		m.put("start",start);
		m.put("count",10);
		return dao.refboardListSearch(m);
	}
	public int countSearch(int searchn, String search) {
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search",search);
		return dao.countSearch(m);
	}
	
	public int deleteRefboard(int no) {
		return dao.deleteRefboard(no);
	}
	public int updateRefboard(RefboardDto dto) {
		return dao.updateRefboard(dto);
	}

	
	

}
