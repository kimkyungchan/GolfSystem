package golf.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.MemDao;
import golf.project.dto.MemDto;

@Service
public class MemService {

	@Autowired
	MemDao dao;
	
	public List<MemDto> member(){
		return dao.member();
	}
	
	public List<MemDto> memuse(String id){
		return dao.memuse(id);
	}
	
	public int delmem(String id) {
		return dao.delmem(id);
	}
}
