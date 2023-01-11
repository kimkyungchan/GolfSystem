package golf.project.member.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import golf.project.member.board.dto.JoinboardDto;
@Mapper
public interface JoinboardDao {
	@Insert("insert into joinboard (id, subject, content, ref, re_step, re_level) values(#{id}, #{subject}, #{content}, #{ref}, #{re_step}, #{re_level})")
	@Options(useGeneratedKeys = true, keyProperty = "no")
	int insert(JoinboardDto dto);
	@Update("update joinboard set ref = #{no} where no =#{no}")// 제목글일때만
	int updateJoin(int no);
	@Update("update joinboard set re_step = re_step+1 where ref =#{ref} and re_step > #{re_step}")
	int updateStep(JoinboardDto dto);
	
	@Select("select count(*) from joinboard")
	int count();
	
	@Select("select * from joinboard order by ref desc, re_step asc limit #{start}, #{count}")
	List<JoinboardDto> selectList(Map<String, Object> m);

	@Update("update joinboard set readcount = readcount + 1 where no = #{no}")
	int updateReadcount(int no);
	@Select("select * from joinboard where no = #{no}")
	JoinboardDto selectOne(int no);
	@Delete("delete from joinboard where no = #{no}")
    int deleteJoinboard(int no);        
    @Update("update joinboard set subject=#{subject}, content=#{content} where no = #{no}")
    int updateJoinboard(JoinboardDto dto);
	
    int countSearch(Map<String, Object> m);
    
    List<JoinboardDto> joinboardListSearch (Map<String, Object> m);
	
    
}
