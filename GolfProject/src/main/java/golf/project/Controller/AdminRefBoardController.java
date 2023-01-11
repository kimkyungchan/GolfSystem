package golf.project.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import golf.project.dto.AdminDto;
import golf.project.dto.AdminRefBoardDto;
import golf.project.service.AdminRefBoardService;

@Controller
@SessionAttributes("admin")
public class AdminRefBoardController {
	
	@Autowired
	AdminRefBoardService service;
	
	@ModelAttribute("admin")
	public AdminDto getDto(){
		return new AdminDto();
	}
	
	@GetMapping("admin/reflist/write")
	public String writeform(@ModelAttribute("dto") AdminRefBoardDto dto) {
		return "adminBoard/refwrite";
	}
	
	@PostMapping("admin/reflist/write")
	public String write(AdminRefBoardDto dto) {
		service.insert(dto);
		return "redirect:";
	}
	
	@GetMapping("/admin/reflist")
	public String list(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		
		int count = service.count();
		if (count > 0) {
			
			int perPage = 10;
			int startRow = (page - 1) * perPage;
			
			List<AdminRefBoardDto> refList = service.refList(startRow, perPage);
			m.addAttribute("start", startRow + 1);
			m.addAttribute("rList", refList);
			
			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);			
		}
		m.addAttribute("count", count);
		
		return "adminBoard/reflist";
	}
	
	@GetMapping("/admin/reflist/content/{no}")
	public String content(@PathVariable int no, Model m) {
		AdminRefBoardDto dto = service.refOne(no);
		m.addAttribute("article", dto);
		return "adminBoard/refcontent";
	}
	
	@DeleteMapping("/reflist/delete")
	@ResponseBody
	public String delete(int no) {
		int i = service.deleteRef(no);
		return ""+i;
	}
	
	@GetMapping("admin/reflist/search")
	public String search(int searchn, String search, @RequestParam(name="p", defaultValue= "1" ) int page, Model m) {
		int count = service.countSearch(searchn, search);
		if(count > 0) {
			
			
	    int perPage = 10;
	    int startRow = (page - 1) * perPage;
	    int endRow = page * perPage;
	    
	    List<AdminRefBoardDto> refList = service.refListSearch(searchn, search, startRow);
	    m.addAttribute("rList", refList);
	    
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
			
		return "adminBoard/refsearch";	
	}

}

