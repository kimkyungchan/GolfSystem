package golf.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.AdminJoinBoardDto;

@Mapper
public interface AdminJoinBoardDao {
	int count();
	List<AdminJoinBoardDto> joinList(Map <String, Object> m);
	AdminJoinBoardDto joinOne(int no);
	int addReadcount(int no);
	
	List<AdminJoinBoardDto> joinListSearch(Map<String, Object> m);
	int countSearch(Map<String, Object> m);
	
	int deleteJoin(int no);
}
