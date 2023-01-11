package golf.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.ResSelDto;

@Mapper
public interface ResSelDao {
	
	List<ResSelDto> selectRes(String seldate);

}
