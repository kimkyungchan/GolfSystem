package golf.project.member.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.member.board.dao.JoinboardDao;
import golf.project.member.board.dto.JoinboardDto;

@Service
public class JoinboardService {
	@Autowired
	JoinboardDao dao;
	
	public void insert(JoinboardDto dto) {
		
		if(dto.getRef() == 0 ) { // 제목글
			dao.insert(dto);
			//System.out.println("no :: "+dto.getNo());
			dao.updateJoin(dto.getNo());
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
			
	public List<JoinboardDto> selectList(int start){
		Map<String, Object> m = new HashMap<>();
		m.put("start", start);
		m.put("count", 10);
		return dao.selectList(m);
	}
			
	public JoinboardDto selectOne(int no) {
		dao.updateReadcount(no);
		return dao.selectOne(no);
	}
	public List<JoinboardDto> joinboardListSearch(int searchn, String search, int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search",search);
		m.put("start",start);
		m.put("count",10);
		return dao.joinboardListSearch(m);
	}
	public int countSearch(int searchn, String search) {
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn",searchn);
		m.put("search",search);
		return dao.countSearch(m);
	}
	
	public int deleteJoinboard(int no) {
		return dao.deleteJoinboard(no);
	}
	public int updateJoinboard(JoinboardDto dto) {
		return dao.updateJoinboard(dto);
	}

	
	

}
