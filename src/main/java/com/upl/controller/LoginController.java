package com.upl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.upl.model.Users;
import com.upl.repository.UserRepository;

@Controller
public class LoginController {

	
	public static boolean admin=false;

	@Autowired
	private UserRepository userRepository; // Assuming you have a UserService to handle user-related operations

	@GetMapping("/")
	public String loginForm() {
		return "login"; // Renders login.jsp
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
		Users user = userRepository.findByUsernameAndPassword(username, password);

		if (user != null) {
			// Redirect based on user role
			String role=user.getRole().toUpperCase();
			switch (role) {
			case "ADMIN":
				admin=true;
				return "redirect:/admin/index";
			case "OWNER":
				return "redirect:/player/index";
			case "PLAYER":
				return "redirect:/player/index";
			default:
				// Handle other roles or unexpected cases
				return "redirect:/";
			}
		} else {
			// Invalid credentials, redirect back to login page with error message
			model.addAttribute("error", "Invalid username or password");
			return "login";
		}
	}
}
