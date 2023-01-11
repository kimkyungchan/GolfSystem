package golf.project.member.board.controller;

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

import golf.project.member.board.dto.MemDto;
import golf.project.member.board.dto.NoticeDto;
import golf.project.member.board.service.NoticeService;

@SessionAttributes("user")
@Controller("notice2Controller")
public class NoticeController {
	@Autowired
	NoticeService service;

	@ModelAttribute("user")
	public MemDto getDto() {
		return new MemDto();
	}

	// 요청 page 번호를 받아서 페이지에 맞는 글을 갯수(10)에 맞게 꺼내옴
	// 전체 글 갯수에 맞춰 페이징 처리
	@RequestMapping("/notice/list")
	public String list(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		// 글이 있는지 체크
		int count = service.count();
		if (count > 0) {
			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<NoticeDto> boardList = service.noticeList(startRow);

			m.addAttribute("bList", boardList);

			int pageNum = 10;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);// 전체 페이지 수

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		} // if(count > 0) end
		m.addAttribute("count", count);
		return "notice/clientlist";
	}

	@GetMapping("notice/content/{no}")
	public String content(@ModelAttribute("user") MemDto user, @PathVariable int no, Model m) {
		NoticeDto dto = service.noticeOne(no);
		m.addAttribute("dto", dto);
		return "notice/content";
	}

	@GetMapping("/notice/search")
	public String search(int searchn, String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(searchn, search);
		if (count > 0) {

			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;
			int endRow = page * perPage;

			List<NoticeDto> boardList = service.noticeListSearch(searchn, search, startRow);
			m.addAttribute("bList", boardList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("start", startRow+1);
			m.addAttribute("begin", begin);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
			m.addAttribute("end", end);
		}
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);

		return "notice/search";
	}
}
