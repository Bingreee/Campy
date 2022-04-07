package campy.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import campy.com.dao.QnaDao;
import campy.com.dto.QaDto;
import campy.com.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	QnaDao qnaDao;

	@RequestMapping("/askWrite")
	public String askWrite() {
		return "askWrite";
	}

	/*
	 * @RequestMapping("/ask") public String askForm(Model model) { List<QaDto> list
	 * = qnaDao.list(); model.addAttribute("list",list); return "askForm"; }
	 */
	
	
}
