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

import golf.project.member.board.dto.JoinboardDto;
import golf.project.member.board.dto.MemDto;
import golf.project.member.board.service.JoinboardService;

@Controller("joinboardController")
@SessionAttributes("user")
public class JoinboardController {
	@Autowired
	JoinboardService service;
	
	@ModelAttribute("user")
	public MemDto getDto() {
		return new MemDto();
	}

	@GetMapping("/join/write")
	public String writeform(@ModelAttribute("dto") JoinboardDto dto) {
		return "join/write";
	}

	@PostMapping("/join/write")
	public String write(JoinboardDto dto) {
		service.insert(dto);
		return "redirect:list";
	}

	@GetMapping("/join/list")
	public String list(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		// 글이 있는지 체크
		int count = service.count();
		if (count > 0) {

			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<JoinboardDto> boardList = service.selectList(startRow);
			m.addAttribute("start", startRow + 1);
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

		return "join/boardList";
	}

	@GetMapping("/join/content/{no}")
	public String content(@PathVariable int no, Model m) {
		JoinboardDto dto = service.selectOne(no);
		m.addAttribute("article", dto);
		return "join/content";
	}

	@GetMapping("/join/search")
	public String search(int searchn, String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(searchn, search);
		if (count > 0) {
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;
			int endRow = page * perPage;

			List<JoinboardDto> boardList = service.joinboardListSearch(searchn, search, startRow);
			m.addAttribute("bList", boardList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			
			m.addAttribute("begin", begin);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
			m.addAttribute("end", end);
		} // if(count>0)
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);

		return "join/boardList";
	}

	@GetMapping("/join/delete/{no}")
	public String delete(@PathVariable int no) {
		service.deleteJoinboard(no);
		return "redirect:/join/list";
	}
	// @PostMapping("join/content")
	// public int updateForm(@PathVariable int no, Model m) {
	// NoticeDto dto = service.updateJoinboard(dto);
	// m.addAttribute("dto", dto);
	// return "join/content";
	// }

	@GetMapping("join/update/{no}")
	public String updateForm(@PathVariable int no, Model m) {
		JoinboardDto dto = service.selectOne(no);
		m.addAttribute("dto", dto);
		return "join/updateForm";
	}

	@PutMapping("/join/update")
	public String updateForm(JoinboardDto dto) {
		service.updateJoinboard(dto);
		return "redirect:list";
	}

}
