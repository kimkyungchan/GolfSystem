package golf.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.AdminResDto;

@Mapper
public interface AdminResDao {
	
	int count();
	List<AdminResDto> adminResList();
	
	int deleteres(int resnum);
	
	
	
	List<AdminResDto> selres();

	int cadcartsel(int resnum);
}
