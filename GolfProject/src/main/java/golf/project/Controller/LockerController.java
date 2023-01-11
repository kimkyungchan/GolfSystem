package golf.project.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import golf.project.dto.LockerDto;
import golf.project.service.LockerService;

@Controller
public class LockerController {

	@Autowired
	LockerService service;
	
	@GetMapping("/admin/locker")
	public String locklist(Model m) {
		List<LockerDto> loclist = service.locklist();
		m.addAttribute("list", loclist);
		return "/admin/LockerManage";
	}
	
	@PostMapping("admin/locker")
	public String lockadd(LockerDto dto) {
		service.updateloc(dto);
		return "redirect:locker";
	}
	
	@GetMapping("/admin/detaillock")
	@ResponseBody
	public String detaillock(int lockno) {
		LockerDto result = service.detaillock(lockno);
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
}
