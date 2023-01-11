package golf.project.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import golf.project.dto.CaddieDto;
import golf.project.service.CaddieService;

@Controller
public class CaddieController {

	@Autowired
	CaddieService service;
	
	@GetMapping("/admin/caddie")
	public String cart(Model m) {
		List<CaddieDto> cadlist=service.Caddielist();
		m.addAttribute("caddietlist", cadlist);
		return "/admin/CaddieManage";
	}
	
	@PostMapping("/admin/caddie")
	public String insertcart(CaddieDto dto) {
		service.insertCaddie(dto);
		return "redirect:caddie";
	}
	
	@GetMapping("/admin/cadupdate")
	@ResponseBody
	public String updatestate(int cadno, int state) {
		service.updatestate(cadno, state);
		return "";
	}
	
	@DeleteMapping("/admin/caddelete")
	@ResponseBody
	public String deleteCaddie(int cadno) {
		service.deleteCaddie(cadno);
		return "";
	}
}
