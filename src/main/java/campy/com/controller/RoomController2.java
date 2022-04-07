package campy.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import campy.com.service.RoomService2;

@Controller
public class RoomController2 {

	@Autowired
	RoomService2 rservice2;
	
	@GetMapping("/room")
	public String room() {
		return "room";
	}
}
