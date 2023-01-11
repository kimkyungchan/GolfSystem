package golf.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.AdminResDao;
import golf.project.dto.AdminResDto;

@Service
public class AdminResService {
	@Autowired
	AdminResDao dao;
	
	public int count() {
		return dao.count();
	}
	
	public List<AdminResDto> adminResList(){
		return dao.adminResList();
	}
	

	public List<AdminResDto> selres(){
		return dao.selres();
	}
	

	public int cadcartsel(int resnum) {
		return dao.cadcartsel(resnum);
	}
	
	public int deleteres(int resnum) {
		return dao.deleteres(resnum);
	}
}
