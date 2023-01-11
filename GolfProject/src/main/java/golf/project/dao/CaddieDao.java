package golf.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.CaddieDto;



@Mapper
public interface CaddieDao {

	List<CaddieDto> Caddielist();
	
	int insertCaddie(CaddieDto dto);
	
	int updatestate(Map<String, Object> map);
	
	int deleteCaddie(int cadno);
	
	List<CaddieDto> waitCaddie();
	
	int assignstate(int cadno);
}
