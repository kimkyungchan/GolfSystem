package golf.project.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import golf.project.dto.AdminResDto;
import golf.project.dto.CaddieDto;
import golf.project.dto.CartDto;
import golf.project.service.AdminResService;
import golf.project.service.CaddieService;
import golf.project.service.CartService;

@Controller
public class CadCartCheckController {

	@Autowired
	CaddieService cadser;
	
	@Autowired
	CartService cartser;
	
	@Autowired
	AdminResService resser;
	
	@GetMapping("/admin/cadcartCheck")
	public String listview(Model m){
		List<CaddieDto> cadlist = cadser.waitCaddie();
		List<CartDto> cartlist = cartser.waitCart();
		List<AdminResDto> reslist = resser.selres();
		
		m.addAttribute("caddie", cadlist);
		m.addAttribute("cart", cartlist);
		m.addAttribute("res", reslist);
		
		return "/admin/cadcartCheck";
	}
	
	@GetMapping("/admin/cadcartupdate")
	@ResponseBody
	public String cadcartupdate(int cadnum, int cartnum, int resnum) {
		cadser.assignstate(cadnum);
		cartser.assignstate(cartnum);
		resser.cadcartsel(resnum);
		return "";
	}
}
