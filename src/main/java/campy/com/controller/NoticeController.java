package campy.com.controller;

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

import campy.com.dto.MemberDto;
import campy.com.dto.NoticeDto;
import campy.com.service.NoticeService;

@SessionAttributes("user")
@Controller
public class NoticeController {

	@Autowired
	NoticeService service;

	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}

	@RequestMapping("/notice/noticeList")
	public String noticeList(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = service.count();
		if (count > 0) {

			int perPage = 5; 
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;

			List<NoticeDto> noList = service.noList(startRow, endRow);
			m.addAttribute("nList", noList);
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
		return "/notice/noticeList";
	}

	@GetMapping("/notice/noticeSearch")
	public String noticeSearch(int noticesearchn, String noticesearch, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(noticesearchn, noticesearch);
		if (count > 0) {

			int perPage = 5; 
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;

			List<NoticeDto> noticeList = service.noticeListSearch(noticesearchn, noticesearch, startRow, endRow);
			m.addAttribute("nList", noticeList);

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
		m.addAttribute("noticesearchn", noticesearchn);
		m.addAttribute("noticesearch", noticesearch);

		return "/notice/noticeSearch";
	}

	@GetMapping("/notice/noticeWrite")
	public String writeForm(@ModelAttribute("user") MemberDto dto) {
		return "/notice/noticeWrite";
	}

	@PostMapping("/notice/noticeWrite")
	public String noticeWrite(NoticeDto dto) {
		service.insert(dto);
		return "redirect:/notice/noticeList";
	}

	@GetMapping("/notice/noticeContent/{no}")
	public String noticeContent(@PathVariable int no, Model m) {
		NoticeDto dto = service.noticeOne(no);
		m.addAttribute("dto", dto);
		return "/notice/noticeContent";
	}

	@GetMapping("/notice/noticeUpdateForm/{no}")
	public String noticeUpdateForm(@PathVariable int no, Model m) {
		NoticeDto dto = service.noticeOne(no);
		m.addAttribute("dto", dto);
		return "/notice/noticeUpdateForm";
	}

	@RequestMapping("/notice/noticeUpdateForm")
	public String noticeUpdateForm(NoticeDto dto) {
		service.updateNotice(dto);
		return "redirect:/notice/noticeList";
	}

	@DeleteMapping("/notice/noticeList/delete")
	@ResponseBody
	public String delete(int not_no) {
		int i = service.deleteNotice(not_no);
		return "" + i;
	}
}
