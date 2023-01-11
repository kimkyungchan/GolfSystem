package golf.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.AdminResSelDao;
import golf.project.dto.AdminResSelDto;

@Service
public class AdminResSelService {
	
	@Autowired
	AdminResSelDao dao;
	
	public int insertSel(AdminResSelDto dto) {
		return dao.insertSel(dto);
	}
	
	public List<String> selcourse() {
		return dao.selcourse();
	}
	
	public int deletesel(Map<String, Object> map) {
		return dao.deletesel(map);
	}

}
