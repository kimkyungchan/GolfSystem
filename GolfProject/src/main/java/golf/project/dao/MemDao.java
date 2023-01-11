package golf.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.MemDto;

@Mapper
public interface MemDao {
	
	List<MemDto> member();
	
	List<MemDto> memuse(String id);

	int delmem(String id);
}
