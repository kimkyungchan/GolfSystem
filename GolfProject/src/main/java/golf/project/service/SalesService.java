package golf.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.SalesDao;
import golf.project.dto.SalesDto;

@Service
public class SalesService {

	@Autowired
	SalesDao dao;
	
	public List<SalesDto> selSales(Map<String,Object> map){
		return dao.selSales(map);
	}
}
