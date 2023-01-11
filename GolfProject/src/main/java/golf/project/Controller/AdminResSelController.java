package golf.project.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import golf.project.dto.AdminResSelDto;
import golf.project.service.AdminResSelService;

@Controller
public class AdminResSelController {
	
	private static final AdminResSelDto AdminResSelDto = null;
	@Autowired
	AdminResSelService service;
	
	@GetMapping("/rsinsert")
	public String rsinsertform(Model m) {
		List<String> courseList = service.selcourse();
		System.out.println(courseList);
		m.addAttribute("cList", courseList);
		return "adminResSel/insertform";
	}
	
	@PostMapping("/rsinsert")
	public String insertSel(AdminResSelDto dto) {
		service.insertSel(dto);
		return "redirect:/rsinsert";
	}
	
	
	
	
	

}
