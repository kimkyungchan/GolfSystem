package golf.project.member.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import golf.project.member.board.dto.MemDto;

@Mapper
public interface MemCilentDao {
	//@Select("select id from mem where id =#{id}")
	String idCheck(String id);

	//@Insert("insert into mem values(#{id},#{password}, #{name}, #{birth}, #{address}")
	int insertMem(MemDto dto);

	//@Select("select * from mem where id=#{id} and password=#{password}")
	MemDto login(MemDto dto);

    @Select("select * from mem where id=#{id}")
    MemDto findMemberById(String id);

	//@Update("update mem set password=#{password}, name=#{name}, birth = #{birth},address=#{address} where id=#{id}")
	int updateMem(MemDto dto);
	
	//@Delete("delete from mem where id=#{id}")
	int deleteMem(String id);
	
	@Select("select id,name,phone, email, address, password from mem")
	List<MemDto> memsInfo();
	
	MemDto selid(Map<String, Object> map);
	
	int updatepass(Map<String,Object> map);
}

