package golf.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.SalesDto;

@Mapper
public interface SalesDao {

	int insertSales(SalesDto dto); //kakaoservice에서 사용
	
	List<SalesDto> selSales(Map<String,Object> map);
}
