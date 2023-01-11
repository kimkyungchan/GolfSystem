package golf.project.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import golf.project.dto.MemDto;
import golf.project.service.MemService;

@Controller
public class MemController {

	@Autowired
	MemService service;
	
	
	@RequestMapping("/home")
	public String dashboard() {
		return "/index";
	}
	
	@GetMapping("/admin/memberManage")
	public String member(Model m) {
		List<MemDto> mlist = service.member();
		m.addAttribute("mlist",mlist);
		return "/admin/memberManage";
	}

	@PostMapping("admin/memberManage")
	@ResponseBody
	public String memuse(String id) {
		List<MemDto> uselist = service.memuse(id);
		Gson gson = new Gson();
		return gson.toJson(uselist);
	}
	
	@DeleteMapping("admin/memberManage")
	@ResponseBody
	public String delmem(String id){
		int ii=service.delmem(id);
		return "";
	}
	
	
}
