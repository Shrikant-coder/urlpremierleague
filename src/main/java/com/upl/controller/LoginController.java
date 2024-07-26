package com.upl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	
	public static boolean admin=false;

	 // Assuming you have a UserService to handle user-related operations

	@GetMapping("/")
	public String loginForm() {
		return "login"; // Renders login.jsp
	}
	@GetMapping("/index")
	public String index() {
		return "/player/index"; // Renders login.jsp
	}
	@GetMapping("owner/index")
	public String loginForm2(Model model) {
		return "/owner/index"; // Renders login.jsp
	}

	@GetMapping("admin/index")
	public String loginForm4(Model model) {
		 model.addAttribute("admin", admin);
		return "/admin/index"; // Renders login.jsp
	}

	@GetMapping("player/index")
	public String loginForm3() {
		return "/player/index"; // Renders login.jsp
	}

	@PostMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, Model model) {
		// Validate credentials
		try {
		if(username.equals("shree")&&password.equals("shree")) {
			return "redirect:/admin/index";
		}else {
			return "redirect:/player/index";
		}
		}catch (Exception e) {
			return "redirect:/";
		}

	}
}
