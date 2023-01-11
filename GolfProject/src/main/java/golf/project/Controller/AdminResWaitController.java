package golf.project.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import golf.project.dto.AdminResWaitDto;
import golf.project.service.AdminResWaitService;

@Controller
public class AdminResWaitController {
	@Autowired
	AdminResWaitService service;
	
	@RequestMapping("/adminResWait/list")
	public String list(@RequestParam(name="p", defaultValue="1")int page, Model m) {
		int count = service.count();
		if(count > 0) {
			
			int perPage = 10;
			int startRow = (page - 1)* perPage;
			
			List<AdminResWaitDto> adminResWaitList = service.adminResWaitList(startRow);
			
			m.addAttribute("aRWList", adminResWaitList);
			
			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);
			
			int begin = (page - 1)/ pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}
		m.addAttribute("count", count);
		return "adminResWait/list";
	}
	
	
	
	
	
	
	
	@GetMapping("/resWaitCheck")
	@ResponseBody
	public int resWaitCheck(AdminResWaitDto dto) {
		System.out.println(dto);
		int resWaitCheck = service.resWaitCheck(dto);		
		System.out.println(resWaitCheck);
		return resWaitCheck;
			
	}
	

	
	
}
