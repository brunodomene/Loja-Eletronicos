package com.lojaeletronicos.controlers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginControler {

	@GetMapping("/login")
	public String login() {
		return "loginForm";
	}
	
}
