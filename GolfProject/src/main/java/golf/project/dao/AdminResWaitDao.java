package golf.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.AdminResWaitDto;

@Mapper
public interface AdminResWaitDao {
	
	int count();
	List<AdminResWaitDto> adminResWaitList(Map<String, Object> m);
	
	int resWaitCheck(AdminResWaitDto dto);

}
