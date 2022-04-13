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

import campy.com.dao.QnaDao;
import campy.com.dto.MemberDto;
import campy.com.dto.QaDto;
import campy.com.dto.Qa_CommDto;
import campy.com.service.QnaService;

@SessionAttributes("user")
@Controller
public class QnaController {

	@Autowired
	QnaService Qservice;

	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}

	@RequestMapping("/ask")
	public String ask(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		// 글이 있는지 체크
		int count = Qservice.count();
		if (count > 0) {

			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;

			List<QaDto> qaList = Qservice.qaList(startRow, endRow);
			m.addAttribute("qaList", qaList);

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
		return "ask";

	}

	@GetMapping("/askWrite")
	public String writeForm(@ModelAttribute("user") MemberDto dto) {
		return "askWrite";
	}

	@PostMapping("/askWrite")
	public String write(QaDto dto) {
		Qservice.insert(dto);
		return "redirect:ask";// 글목록
	}

	@RequestMapping("/search")
	public String search(int searchn, String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = Qservice.countSearch(searchn, search);
		if (count > 0) {

			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;

			List<QaDto> qaList = Qservice.qaListSearch(searchn, search, startRow, endRow);
			m.addAttribute("qaList", qaList);

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
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);

		return "search";
	}

	@GetMapping("/askContent/{no}")
	public String askContent(@PathVariable int no, Model m) {
		QaDto dto = Qservice.qaOne(no);
		m.addAttribute("dto", dto);
		List<Qa_CommDto> cList = Qservice.selectComm(no);
		m.addAttribute("cList", cList);
		return "askContent";
	}

	@GetMapping("/update/{no}")
	public String updateForm(@PathVariable int no, Model m) {
		QaDto dto = Qservice.qaOne(no);
		m.addAttribute("dto", dto);
		return "askContent";
	}

	@PutMapping("/update")
	public String update(QaDto dto) {
		Qservice.updateQa(dto);
		return "redirect:ask";
	}

	@DeleteMapping("/delete")
	@ResponseBody
	public String delete(int no) {
		int i = Qservice.deleteQa(no);
		return "" + i;
	}

}