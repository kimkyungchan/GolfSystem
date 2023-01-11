package golf.project.service;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import golf.project.dao.CartDao;
import golf.project.dto.CartDto;

@Service
public class CartService {
	@Autowired
	CartDao dao;
	
	public List<CartDto> Cartlist(){
		return dao.Cartlist();
	}
	
	public int insertCart(CartDto dto) {
		return dao.insertCart(dto);
	}
	
	public int updatestate(int cartno, int state) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cartno", cartno);
		map.put("state", state);
		return dao.updatestate(map);
	}
	
	public int deleteCart(int cartno) {
		return dao.deleteCart(cartno);
	}
	
	public List<CartDto> waitCart(){
		return dao.waitCart();
	}
	
	public int assignstate(int cartno) {
		return dao.assignstate(cartno);
	}
}
