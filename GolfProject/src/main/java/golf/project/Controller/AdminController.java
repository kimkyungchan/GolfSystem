package golf.project.Controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import golf.project.dto.AdminDto;
import golf.project.service.AdminService;

@Controller
@SessionAttributes("admin")    
public class AdminController {
	@Autowired
	AdminService service;
	
	@ModelAttribute("admin")
	public AdminDto getDto(){
		return new AdminDto();
	}

	
	@GetMapping("/admin/loginform")
	public String loginform() {
		return "admin/loginform";
	}
	
	@PostMapping("/admin/login")
	public String login(@ModelAttribute("command")@Valid AdminDto dto, BindingResult error, Model m) {
		if(error.hasErrors()) {
			return "admin/loginform";
		}
		
		AdminDto loginDto = service.login(dto);
		if(loginDto == null) {
			error.reject("nocode", "ID, PASS를 확인해주세요.");
			return "admin/loginform";
		}else {
			m.addAttribute("admin", loginDto);
		}
		return "redirect:/admin/main";
	}
	
	@GetMapping("/admin/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	@RequestMapping("/admin/main")
	public String adminMain(@ModelAttribute("admin")AdminDto dto) {
		if(dto.getAdmin_ID() != null) {
			return "admin/main";
		}else {
			return "admin/loginform";
		}
	}
	
	
	
	
	

}
