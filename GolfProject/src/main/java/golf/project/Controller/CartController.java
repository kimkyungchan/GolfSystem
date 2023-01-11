package golf.project.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import golf.project.dto.CartDto;
import golf.project.service.CartService;

@Controller
public class CartController {

	@Autowired
	CartService service;
	
	@GetMapping("/admin/cart")
	public String cart(Model m) {
		List<CartDto> cartlist=service.Cartlist();
		m.addAttribute("cartlist", cartlist);
		return "/admin/CartManage";
	}
	
	@PostMapping("/admin/cart")
	public String insertcart(CartDto dto) {
		service.insertCart(dto);
		return "redirect:cart";
	}
	
	@GetMapping("/admin/cartupdate")
	@ResponseBody
	public String updatestate(int cartno, int state) {
		service.updatestate(cartno, state);
		return "";
	}
	
	@DeleteMapping("/admin/cartdelete")
	@ResponseBody
	public String deleteCart(int cartno) {
		service.deleteCart(cartno);
		return "";
	}
	
}
