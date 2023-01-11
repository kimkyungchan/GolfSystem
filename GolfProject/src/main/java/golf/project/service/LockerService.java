package golf.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.LockerDao;
import golf.project.dto.LockerDto;

@Service
public class LockerService {

	@Autowired
	LockerDao dao;
	
	public LockerDto detaillock(int lockno) {
		return dao.detaillock(lockno);
	}
	
	public List<LockerDto> locklist(){
		return dao.locklist();
	}
	
	public int updateloc(LockerDto dto) {
		return dao.updateloc(dto);
	}
}
