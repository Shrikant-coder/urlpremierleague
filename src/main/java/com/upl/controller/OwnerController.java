package com.upl.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.upl.model.Owner;
import com.upl.model.Player;
import com.upl.repository.OwnerRepository;



@Controller
@RequestMapping("/owner")
public class OwnerController {

	@Autowired
	private OwnerRepository ownerService;


	/*
	 * @GetMapping("/niranjan") public ResponseEntity<Map<String, String>>
	 * getPlayersNiranjan() { Map<String, String> players = new HashMap<>();
	 * players.put("Player A", "Batsman"); return ResponseEntity.ok(players); }
	 */
	@GetMapping("/players/{owner}")
	public ResponseEntity<Map<String, String>> getPlayersByOwner(@PathVariable String owner) {
	    Map<String, String> players = new HashMap<>();

	    // Sample data using a Map
	    switch (owner) {
	        case "NiranjanDongale":
	            players.put("Sahil Dongale-Captain", "All Rounder");
	            players.put("Sanket Mane", "Batsman");
	            players.put("Deepak Dongale", "Batsman");
	            players.put("Suraj Dongale", "All Rounder");
	            players.put("Sudhir Kadam", "Batsman");
	            players.put("Dinkar Mane", "All Rounder");
	            players.put("Tejas Mane", "Batsman");
	            players.put("Aniket Mane", "All Rounder");
	            players.put("Tejas Phadatare", "Batsman");
	            players.put("Aryan Mokashi", "Batsman");
	            players.put("Vinayak Pawar", "Batsman");
	            players.put("Kedar Desai", "All Rounder");
	            players.put("Tejas Phadatare", "Batsman");
	            players.put("Sameer More", "Batsman");
	            break;
	        case "RanjeetShilwant":
	        	 players.put("Shailesh Shinde-Captain", "All Rounder");
		            players.put("Sanjay Kadam", "Batsman");
		            players.put("Shahid Mulani", "Batsman");
		            players.put("Aniket Nikam", "All Rounder");
		            players.put("Nil Kamble", "Batsman");
		            players.put("Babu NIkam", "All Rounder");
		            players.put("Nikhil Salunkhe", "Batsman");
		            players.put("Sahil Desai", "All Rounder");
		            players.put("Adarsh Sutar", "Batsman");
		            players.put("Akshay More", "Batsman");
		            players.put("Vinay Desai", "Batsman");
		            players.put("Harshad Desai", "All Rounder");
		            players.put("Suraj Shilwant", "Batsman");
		            players.put("Shrinath Desai", "Batsman");
	            break;
	        case "SantoshDeshmukh":
	        	 players.put("Rohit Pawar-Captain", "All Rounder");
		            players.put("Akshay Nikam", "Batsman");
		            players.put("Navnath Kadam", "Batsman");
		            players.put("Akshay Kadam", "All Rounder");
		            players.put("Yogesh Salunkhe", "Batsman");
		            players.put("Umesh Kadam", "All Rounder");
		            players.put("Amol More", "Batsman");
		            players.put("Baburao Desai", "All Rounder");
		            players.put("Surykant Pawar", "Batsman");
		            players.put("Ajay Desai", "Batsman");
		            players.put("Ganesh Mane", "Batsman");
		            players.put("Vishal Nikam", "All Rounder");
		            players.put("Mahesh Desai", "Batsman");
		            players.put("Nitish Desai", "Batsman");
	            break;
	        case "SunilPawar":
	            players.put("Akshay Desai-Captain", "All Rounder");
	            players.put("Karan Desai", "Bowler");
	            break;
	        case "PankajMokashi":
	        	 players.put("Shrikant Surve-Captain", "All Rounder");
		            players.put("Aditya Thorat", "Batsman");
		            players.put("Sairaj Mane", "Batsman");
		            players.put("Vishal Desai", "All Rounder");
		            players.put("Omkar Zanzane", "All Rounder");
		            players.put("Akshay Sutar", "Batsman");
		            players.put("Akshay Kamble", "Batsman");
		            players.put("Vishal Pawar", "All Rounder");
		            players.put("Ganesh Kadam", "Batsman");
		            players.put("Amol Desai", "Batsman");
		            players.put("Shivnath Nikam", "Batsman");
		            players.put("Sarvesh Desai", "All Rounder");
		            players.put("Bapu More", "Batsman");
		            players.put("Rahul Bhise", "Batsman");
		            players.put("Shreyash Nikam", "Batsman");
	            break;
	        case "SantoshLohar":
	        	 players.put("Ananda Salunkhe-Captain", "All Rounder");
		            players.put("Ganesh More", "Batsman");
		            players.put("Prathmesh More", "Batsman");
		            players.put("Shriraj Mane", "All Rounder");
		            players.put("Vijay Mane", "All Rounder");
		            players.put("Vaibhav Lohar", "Batsman");
		            players.put("Omkar Sutar", "Batsman");
		            players.put("Sunny Gaikwad", "All Rounder");
		            players.put("Nikhil Kadam", "Batsman");
		            players.put("Sameer Desai", "Batsman");
		            players.put("Ajay Desai", "Batsman");
		            players.put("Omkar Pawar", "All Rounder");
		            players.put("Akshay Mane", "Batsman");
		            players.put("Dada Mane", "Batsman");
		            
	            break;
	        case "HarshwardhanNikam":
	        	 players.put("Kumar Pawar-Captain", "All Rounder");
		            players.put("Sushant Nikam", "Batsman");
		            players.put("Vaibhav Kadam", "Batsman");
		            players.put("Vinod Desai", "All Rounder");
		            players.put("Rahul Nikam", "All Rounder");
		            players.put("Shubham Nikam", "Batsman");
		            players.put("Asim Mulani", "Batsman");
		            players.put("Rahul More", "All Rounder");
		            players.put("Vijay Desai", "Batsman");
		            players.put("Krushna Veer", "Batsman");
		            players.put("Uday Nikam", "Batsman");
		            players.put("Sujeet Mokashi", "All Rounder");
		            players.put("Vinu Nikam", "Batsman");
		           
	            break;
	        case "AniketKadam":
	        	 players.put("Arjun Kadam-Captain", "All Rounder");
		            players.put("Tanaji Kadam", "Batsman");
		            players.put("Raviraj Kadam", "Batsman");
		            players.put("Bhagwat Kadam", "All Rounder");
		            players.put("Machindra Kadam", "All Rounder");
		            players.put("Somnath Kadam", "Batsman");
		            players.put("Adinath Mane", "Batsman");
		            players.put("Pranav Surve", "All Rounder");
		            players.put("Umesh Pawar", "Batsman");
		            players.put("Aniket Kamble", "Batsman");
		            players.put("Rohan Pawar", "Batsman");
		            players.put("Suhas Mokashi", "All Rounder");
		            players.put("Raviraj kadam", "Batsman");
	            break;
	        default:
	            // No players for unrecognized owner
	            return ResponseEntity.notFound().build(); // Return 404 if no players found
	    }

	    return ResponseEntity.ok(players); // Return 200 with players map
	}

	@GetMapping("/owners")
	public ResponseEntity<List<Owner>> getAllOwners() {
		List<Owner> owners = ownerService.findAll();
		Player defaultCaptain = new Player();
		defaultCaptain.setName("<NOT SET>");
		return ResponseEntity.ok(owners);
	}
	@SuppressWarnings("unlikely-arg-type")
	@GetMapping("/owners/groupA")
	public ResponseEntity<List<Owner>> getAllOwnersA() {
		List<Owner> owners = ownerService.findAll();
		return ResponseEntity.ok(owners.stream()
	            .filter(owner -> owner.getId() == 5 || owner.getId() == 10 || owner.getId() == 11 || owner.getId() == 12)
	            .collect(Collectors.toList()));
	}
	@SuppressWarnings("unlikely-arg-type")
	@GetMapping("/owners/groupB")
	public ResponseEntity<List<Owner>> getAllOwnersB() {
		List<Owner> owners = ownerService.findAll();
		return ResponseEntity.ok(owners.stream()
	            .filter(owner -> owner.getId() == 6 || owner.getId() == 7 || owner.getId() == 14 || owner.getId() == 13)
	            .collect(Collectors.toList()));
	}
}
