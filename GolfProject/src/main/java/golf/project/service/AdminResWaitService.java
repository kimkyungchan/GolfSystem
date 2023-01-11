package golf.project.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.AdminResWaitDao;
import golf.project.dto.AdminResWaitDto;

@Service
public class AdminResWaitService {
	@Autowired
	AdminResWaitDao dao;
	
	public int count() {
		return dao.count();
	}
	
	public List<AdminResWaitDto> adminResWaitList(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.adminResWaitList(m);
	}
	
	public int resWaitCheck(AdminResWaitDto dto) {
		return dao.resWaitCheck(dto);
	}
	

}
