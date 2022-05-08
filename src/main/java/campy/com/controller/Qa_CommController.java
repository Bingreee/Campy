package campy.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import campy.com.dto.QaDto;
import campy.com.dto.Qa_CommDto;
import campy.com.service.Qa_CommService;

@RestController
public class Qa_CommController {

	@Autowired
	Qa_CommService cservice;
	
	@PostMapping("/ask/insertComm")
	public String insertComm(Qa_CommDto dto) {
		int i = cservice.insertComm(dto);
		return i+"";
	}
	
	@DeleteMapping("/ask/deleteComm/{qa_comm}")
	public String deleteComm(@PathVariable int qa_comm) {
		int i = cservice.deleteComm(qa_comm);
		return i+"";
	}
	

}
