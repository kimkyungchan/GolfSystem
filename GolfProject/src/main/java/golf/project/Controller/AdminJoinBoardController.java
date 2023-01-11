package golf.project.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import golf.project.dto.AdminDto;
import golf.project.dto.AdminJoinBoardDto;
import golf.project.service.AdminJoinBoardService;

@Controller
@SessionAttributes("admin")
public class AdminJoinBoardController {
	@Autowired
	AdminJoinBoardService service;
	
	
	@ModelAttribute("admin")
	public AdminDto getDto(){
		return new AdminDto();
	}
	
	@RequestMapping("admin/joinlist")
	public String list(@RequestParam(name="p", defaultValue="1")int page, Model m) {
		int count = service.count();
		if(count > 0) {
			
			int perPage = 10;
			int startRow = (page - 1)* perPage;
			
			List<AdminJoinBoardDto> joinList = service.joinList(startRow);
			
			m.addAttribute("jList", joinList);
			
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
		return "adminBoard/joinlist";
	}
	
	@DeleteMapping("/joinlist/delete")
	@ResponseBody
	public String delete(int no) {
		int i = service.deleteJoin(no);
		return ""+i;
	}
	
	@GetMapping("admin/joinlist/content/{no}")
	public String content(@PathVariable int no, Model m) {
		AdminJoinBoardDto dto = service.joinOne(no);
		m.addAttribute("dto", dto);
		return "adminBoard/joincontent";
	}
	
	@GetMapping("admin/joinlist/search")
	public String search(int searchn, String search, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(searchn, search);
		if(count > 0) {
			
			int perPage = 10;
			int startRow = (page - 1) * perPage;
			
			int endRow = page * perPage;
			
			List<AdminJoinBoardDto> joinList = service.joinListSearch(searchn, search, startRow);
			m.addAttribute("jList", joinList);
			
			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if(end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
			m.addAttribute("end", end);
		}
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);
		
		return "adminBoard/joinsearch";
	}
	
	




}
