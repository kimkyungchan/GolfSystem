package golf.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.AdminDao;
import golf.project.dto.AdminDto;

@Service
public class AdminService {
	@Autowired
	AdminDao dao;
	
	public AdminDto login(AdminDto dto) {
		return dao.login(dto);
	}
	
	

}
