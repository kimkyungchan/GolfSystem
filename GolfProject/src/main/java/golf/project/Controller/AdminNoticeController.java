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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import golf.project.dto.AdminDto;
import golf.project.dto.AdminNoticeDto;
import golf.project.service.AdminNoticeService;

@Controller
@SessionAttributes("admin")
@RequestMapping("/admin")
public class AdminNoticeController {
	@Autowired
	AdminNoticeService service;
	
	@ModelAttribute("admin")
	public AdminDto getDto(){
		return new AdminDto();
	}
	
	@GetMapping("/notice/write")
	public String writeForm(@ModelAttribute("admin")AdminDto dto) {
		return "adminNotice/write";
	}
	
	@PostMapping("/notice/write")
	public String write(AdminNoticeDto dto , @ModelAttribute("admin")AdminDto adto) {
		dto.setAdmin_ID(adto.getAdmin_ID());
		
		service.insert(dto);
		return "redirect:adminlist";	
	}
	
	@RequestMapping("/notice/adminlist")
	public String list(@RequestParam(name="p", defaultValue="1")int page, Model m) {
		int count = service.count();
		if(count > 0) {
			
			int perPage = 10;
			int startRow = (page - 1)* perPage;
			
			List<AdminNoticeDto> noticeList = service.noticeList(startRow);
			
			m.addAttribute("nList", noticeList);
			
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
		return "adminNotice/adminlist";
	}
	
	@GetMapping("/notice/content/{no}")
	public String content(@PathVariable int no, Model m) {
		AdminNoticeDto dto = service.noticeOne(no);
		m.addAttribute("dto", dto);
		return "adminNotice/content";
	}
	
	@GetMapping("notice/update/{no}")
	public String updateForm(@PathVariable int no, Model m) {
		AdminNoticeDto dto = service.noticeOne(no);
		m.addAttribute("dto", dto);
		return "adminNotice/updateform";	
	}
	
	@PutMapping("/notice/update")
	public String update(AdminNoticeDto dto) {
		service.updateNotice(dto);
		return "redirect:adminlist";
	}
	
	@DeleteMapping("/notice/delete")
	@ResponseBody
	public String delete(int no) {
		int i = service.deleteNotice(no);
		return ""+i;
	}
	
	@GetMapping("/notice/search")
	public String search(int searchn, String search, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(searchn, search);
		if(count > 0) {
			
			int perPage = 10;
			int startRow = (page - 1) * perPage;
			
			int endRow = page * perPage;
			
			List<AdminNoticeDto> noticeList = service.noticeListSearch(searchn, search, startRow);
			m.addAttribute("nList", noticeList);
			
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
		
		return "adminNotice/search";
	}
	
	
	

}
