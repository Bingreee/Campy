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
import campy.com.service.Qa_CommService;
import campy.com.service.QnaService;

@SessionAttributes("user")
@Controller
public class QnaController {

	@Autowired
	QnaService qservice;
	
	@Autowired
	Qa_CommService cservice;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}

	@RequestMapping("/ask/ask")
	public String ask(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		
		int count = qservice.count();
		if (count > 0) {

			int perPage = 8; 
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;

			List<QaDto> qaList = qservice.qaList(startRow, endRow);
			m.addAttribute("qaList", qaList);

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
		return "/ask/ask";

	}

	@GetMapping("/ask/askWrite")
	public String writeForm(@ModelAttribute("user") MemberDto dto) {
		return "/ask/askWrite";
	}

	@PostMapping("/ask/askWrite")
	public String askWrite(QaDto dto) {
		qservice.insert(dto);
		return "redirect:/ask/ask";
	}

	@GetMapping("/ask/search")
	public String search(int searchn, String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = qservice.countSearch(searchn, search);
		if (count > 0) {

			int perPage = 8; 
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;

			List<QaDto> qaList = qservice.qaListSearch(searchn, search, startRow, endRow);
			m.addAttribute("qaList", qaList);

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
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);

		return "/ask/search";
	}

	@GetMapping("/ask/askContent/{qa_no}")
	public String askContent(@PathVariable int qa_no, Model m) {
		QaDto dto = qservice.qaOne(qa_no);
		m.addAttribute("dto", dto);
		List<Qa_CommDto> cList = cservice.selectComm(qa_no);
		m.addAttribute("cList", cList);
		return "/ask/askContent";
	}

	@GetMapping("/ask/updateForm/{qa_no}") 
	public String updateForm(@PathVariable int qa_no, Model m) {
		QaDto dto = qservice.qaOne(qa_no);
		m.addAttribute("dto", dto);
		return "/ask/updateForm";
	}

	@RequestMapping("/ask/update")
	public String update(QaDto dto) {
		qservice.updateQa(dto);
		return "redirect:/ask/ask";
	}

	@DeleteMapping("/ask/delete")
	@ResponseBody
	public String delete(int qa_no) {
		int i = qservice.deleteQa(qa_no);
		return "" + i;
	}

}