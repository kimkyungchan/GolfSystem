package golf.project.dao;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.AdminDto;

@Mapper
public interface AdminDao {
	
	AdminDto login(AdminDto dto);

}
