package golf.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.AdminResSelDto;

@Mapper
public interface AdminResSelDao {
	
	int insertSel(AdminResSelDto dto);
	List<String> selcourse();
	
	int deletesel(Map<String, Object> map);
	
}
