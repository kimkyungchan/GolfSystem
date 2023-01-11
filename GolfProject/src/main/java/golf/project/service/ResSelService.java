package golf.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.ResSelDao;
import golf.project.dto.ResSelDto;

@Service
public class ResSelService {
	
	@Autowired
	ResSelDao dao;
	
	public List<ResSelDto> selectRes(String seldate){
		return dao.selectRes(seldate);
	}

}
