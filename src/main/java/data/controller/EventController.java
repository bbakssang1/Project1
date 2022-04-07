package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EventController {
	
	@GetMapping("/event/main")
	public String eventPage() {
		return "/event/eventmain";
	}
	
	@GetMapping("/event/event1")
	public String eventPage1() {
		return "/event/event1";
	}
}
