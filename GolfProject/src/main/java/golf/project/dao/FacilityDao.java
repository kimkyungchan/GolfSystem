package golf.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.QuestionDto;
import golf.project.dto.ResultDto;

@Mapper
public interface FacilityDao {

	List<QuestionDto> categoryselc(int category);
	
	int savedata(Map<String,Object> m);
	
	List<Map<String, Object>> countnull(Map<String, Object> map);
	
	List<Map<String, Object>> resultlist(Map<String, Object> map);
	
	List<ResultDto> exceldownload(Map<String, Object> map);
}
