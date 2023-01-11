package golf.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.FacilityDao;
import golf.project.dto.QuestionDto;
import golf.project.dto.ResultDto;

@Service
public class FacilityService {

	@Autowired
	FacilityDao dao;
	
	public List<QuestionDto> categoryselc(int category){
		return dao.categoryselc(category);
	}
	
	public int savedata(Map<String,Object> m) {
		return dao.savedata(m);
	}
	
	public List<Map<String, Object>> resultlist(Map<String, Object> map){
		return dao.resultlist(map);
	}
	
	public List<Map<String, Object>> countnull(Map<String, Object> map){
		return dao.countnull(map);
	}
	
	public List<ResultDto> exceldownload(Map<String, Object> map){
		return dao.exceldownload(map);
	}
}
