package golf.project.member.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import golf.project.member.board.dto.MemDto;
import golf.project.member.board.dto.RefboardDto;
import golf.project.member.board.service.RefboardService;

@SessionAttributes("user")
@Controller("refboardController")
public class RefboardController {
	@Autowired
	RefboardService service;
	
	@ModelAttribute("user")
	public MemDto getDto() {
		return new MemDto();
	}
	
	@GetMapping("/")
	public String main() {
		return "mem/main";
	}
		

	@GetMapping("/ref/write")
	public String writeform(@ModelAttribute("dto") RefboardDto dto) {
		return "ref/write";
	}

	@PostMapping("/ref/write")
	public String write(RefboardDto dto) {
		service.insert(dto);
		return "redirect:list";
	}

	@GetMapping("/ref/list")
	public String list(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		// 글이 있는지 체크
		int count = service.count();
		if (count > 0) {

			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<RefboardDto> boardList = service.selectList(startRow);
			m.addAttribute("start", startRow+1);
			m.addAttribute("bList", boardList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

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

		return "ref/boardList";
	}

	@GetMapping("/ref/content/{no}")
	public String content(@PathVariable int no, Model m) {
		RefboardDto dto = service.selectOne(no);
		m.addAttribute("article", dto);
		return "ref/content";
	}
	@GetMapping("/ref/search")
	public String search(int searchn, String search, @RequestParam(name="p", defaultValue="1") 
	int page, Model m) {
		int count = service.countSearch(searchn, search);
		if(count>0) {
			int perPage=10; //한 페이지에 보일 글의 갯수
			int startRow = (page-1)*perPage;
			int endRow = page * perPage;
			
			List<RefboardDto> boardList = service.refboardListSearch(searchn, search, startRow);
			m.addAttribute("bList",boardList);
			
			int pageNum=5;
			int totalPages= count/perPage + (count % perPage > 0?1:0); //전체 페이지 수
			
			int begin = (page-1)/pageNum*pageNum+1;
			int end = begin+pageNum-1;
			if(end > totalPages) {
				end=totalPages;
			}
			m.addAttribute("start", startRow+1);
			m.addAttribute("begin",begin);
			m.addAttribute("pageNum",pageNum);
			m.addAttribute("totalPages",totalPages);
			m.addAttribute("end",end);
		}//if(count>0)
		m.addAttribute("count",count);
		m.addAttribute("searchn",searchn);
		m.addAttribute("search",search);
		
		return "ref/boardList";
	}
	@GetMapping("/ref/delete/{no}")
	public String delete(@PathVariable int no) {
		service.deleteRefboard(no);
		return "redirect:/ref/list";
	}
	//@PostMapping("ref/content")
	//public int updateForm(@PathVariable int no, Model m) {
		//NoticeDto dto = service.updateRefboard(dto);
		//m.addAttribute("dto", dto);
		//return "ref/content";
	//}
	
	@GetMapping("ref/update/{no}")
	   public String updateForm(@PathVariable int no, Model m) {
		RefboardDto dto = service.selectOne(no);
	      m.addAttribute("dto", dto);
	      return "ref/updateForm";
	   }

	  @PutMapping("/ref/update")
	   public String updateForm(RefboardDto dto) {
	      service.updateRefboard(dto);
	      return "redirect:list";
	   }


		
}
	


