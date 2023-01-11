package golf.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Update;

import golf.project.dto.AdminRefBoardDto;

@Mapper
public interface AdminRefBoardDao {
	@Insert("insert into refboard (id, subject, content, ref, re_step, re_level) values(#{id}, #{subject}, #{content}, #{ref}, #{re_step}, #{re_level})")
	@Options(useGeneratedKeys = true, keyProperty = "no")
	int insert(AdminRefBoardDto dto);
	
	@Update("update refboard set ref = #{no} where no =#{no}")
	int updateRef(int no);
	@Update("update refboard set re_step = re_step+1 where ref =#{ref} and re_step > #{re_step}")
	int updateStep(AdminRefBoardDto dto);
	
	int count();
	List<AdminRefBoardDto> refList(Map <String, Object> m);
	AdminRefBoardDto refOne(int no);
	int addReadcount(int no);
	
	List<AdminRefBoardDto> refListSearch(Map<String, Object> m);
	int countSearch(Map<String, Object> m);
	
	int deleteRef(int no);

}
