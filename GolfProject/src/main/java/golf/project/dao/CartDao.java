package golf.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import golf.project.dto.CartDto;

@Mapper
public interface CartDao {

	List<CartDto> Cartlist();
	
	int insertCart(CartDto dto);
	
	int updatestate(Map<String, Object> map);
	
	int deleteCart(int cartno);
	
	List<CartDto> waitCart();
	
	int assignstate(int cartno);
}
