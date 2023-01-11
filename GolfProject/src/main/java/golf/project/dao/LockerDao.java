package golf.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.LockerDto;

@Mapper
public interface LockerDao {

	LockerDto detaillock(int lockno);
	
	List<LockerDto> locklist();
	
	int updateloc(LockerDto dto);
}
