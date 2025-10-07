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

	 
	@GetMapping("/players/{owner}")
	public ResponseEntity<Map<String, String>> getPlayersByOwner(@PathVariable String owner) {
	    Map<String, String> players = new HashMap<>();

	    // Sample data using a Map
	    switch (owner) {
	        case "Aniket":
	            players.put("Vaibhav Kadam-Captain", "All Rounder");
	            players.put("Machindra Kadam", "Batsman");
	            players.put("Umesh Kadam", "Batsman");
	            players.put("Rushi Kadam", "All Rounder");
	            players.put("Krushnat Kadam", "Batsman");
	            players.put("Sachin Kadam", "All Rounder");
	            players.put("Vinayak Kadam", "Batsman");
	            players.put("Amol More", "All Rounder");
	            players.put("Ganesh Kadam", "Batsman");
	            players.put("Tanaji Kadam", "Batsman");
	            players.put("Bhagvat Kadam", "Batsman");
	            players.put("Raviraj Kadam", "All Rounder");
	            players.put("Omkar Kadam", "Batsman");

	            break;
	        case "Pankaj":
	        	 players.put("Shrikant Surve", "All Rounder");
		            players.put("Aditya Thorat", "Batsman");
		            players.put("Vinay Desai ", "Batsman");
		            players.put("Nilesh Mane", "Batsman");
		            players.put("Chetan Kamble", "All Rounder");
		            players.put("Sachin Surve", "Batsman");
		            players.put("Shreyash Nikam", "All Rounder");
		            players.put("Jaywant Surve", "Batsman");
		            players.put("Bhau Desai", "Batsman");
		            players.put("Tejas Phadtare ", "Batsman");
		            players.put("Pranit  Mokashi", "All Rounder");
				    players.put("Sachin Nikam", "Batsman");
				    players.put("Santosh Lohar", "All Rounder");
				    players.put("Kunal Dabhade", "Batsman");
				    players.put("Suhas Mokashi", "All Rounder");
				    players.put("Bapu Mokashi", "All Rounder");

	            break;
	        case "Dada":
	        	 players.put("Rohit Mane", "All Rounder");
		            players.put("Prathamesh More", "Batsman");
		            players.put("Sairaj  Mane", "Batsman");
		            players.put("Ajit Kadam", "All Rounder");
		            players.put("Arjun Kadam", "Batsman");
		            players.put("Saurabh Katkar", "All Rounder");
		            players.put("Aniket Mane", "Batsman");
		            players.put("Sakharam  Kadam", "All Rounder");
		            players.put("Tejas Mane", "Batsman");
		            players.put("Dinkar  Mane", "Batsman");
		            players.put("Ajay Mane", "Batsman");
		            players.put("Dinu Mane", "All Rounder");

		          
	            break;

			case "Yogesh":
				players.put("Shailesh Shinde", "All Rounder");
				players.put("Akshay Nikam", "Batsman");
				players.put("Vaibhav Desai", "Batsman");
				players.put("Suryakant Pawar", "All Rounder");
				players.put("Shahid Mulani", "All Rounder");
				players.put("Aniket Nikam", "Batsman");
				players.put("Vinay Nikam", "Batsman");
				players.put("Dattaray Nikam", "All Rounder");
				players.put("Akshay More ", "Batsman");
				players.put("Ketan Desai", "Batsman");
				players.put("Avinash Dongle", "Batsman");
				players.put("Navnath Kadam", "All Rounder");
				players.put("Nikhil  Salunkhe", "Batsman");
				players.put("Shreenath Desai", "Batsman");
				players.put("Nitish Desai", "Batsman");
				players.put("Somnath Kadam", "Batsman");
				break;


	        case "Akash":
	            players.put("Sameer Desai-Captain", "All Rounder");
				players.put("Aniket Kamble", "Batsman");
				players.put("Tushar Desai", "Batsman");
				players.put("Omkar Desai", "Batsman");
				players.put("Sujit Desai", "All Rounder");
				players.put("Vinod Desai", "Batsman");
				players.put("Yuvraj Kadam", "Batsman");
	            players.put("Karan Desai", "Bowler");
	            players.put("Ranjeet Shilwant", "Batsman");
	            players.put("Vishal Desai", "All Rounder");
	            players.put("Omkar Desai", "All Rounder");
	            players.put("Sahil Desai", "Batsman");
	            players.put("Deepak Dongle", "Batsman");
				players.put("Omkar Pawar", "Batsman");



	            break;



	        case "Sanket":
	        	 players.put("Sahil Dongale -Captain", "All Rounder");
		            players.put("Suraj Dongale", "Batsman");
		            players.put("Rahul More", "Batsman");
		            players.put("Nikhil Kadam", "All Rounder");
		            players.put("Sakharam Desai", "All Rounder");
		            players.put("Omkar Zanzane", "Batsman");
		            players.put("Abhishek Dongale", "Batsman");
		            players.put("Nitin Kadam", "All Rounder");
		            players.put("Manoj Kadam", "Batsman");
		            players.put("Vishal Kadam", "Batsman");
		            players.put("Vinod Nalawade", "Batsman");
		            
	            break;

	        case "Mahesh":
	        	 players.put("Rohit Pawar-Captain", "All Rounder");
		            players.put("Sanjay Kadam", "Batsman");
		            players.put("Vishal Nikam", "Batsman");
		            players.put("Sunny Gaikwad", "All Rounder");
		            players.put("Baburao Desai", "All Rounder");
		            players.put("Niranjan Desai", "Batsman");
		            players.put("Ajay Desai", "Batsman");
		            players.put("Deepak Kadam", "All Rounder");
		            players.put("Suhas Desai", "Batsman");
		            players.put("Sudhir Kadam", "Batsman");
		            players.put("Rohan Pawar", "Batsman");
		            players.put("Sarvesh Desai", "All Rounder");
		            players.put("Vishal Kadam", "Batsman");
				players.put("Sahil Surve", "Batsman");

	            break;

			case "Kumar":
				players.put("Shubham Nikam-Captain", "All Rounder");
				players.put("Rahul Nikam", "All Rounder");
				players.put("Asim Mulani", "Batsman");
				players.put("Sushant Nikam", "Batsman");
				players.put("Vaibhav Pawar", "Batsman");
				players.put("Akash Surywanshi", "All Rounder");
				players.put("Raju More", "All Rounder");
				players.put("Uday Nikam", "Batsman");
				players.put("Sanket Pawar", "Batsman");
				players.put("Vikram Veer", "Batsman");
				players.put("Shivnath Nikam", "Batsman");
				players.put("Niranjan Dongle", "All Rounder");
				players.put("Harshad Desai", "Batsman");
				players.put("Piyush Sapkal", "Batsman");
				players.put("Uddesh Nikam", "Batsman");

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
	            .filter(owner -> owner.getName().equals("Yogesh Salunkhe") || owner.getName().equals("Sanket Mane") || owner.getName().equals("Mahesh Desai") || owner.getName().equals("Aniket Kadam"))
	            .collect(Collectors.toList()));
	}
	@SuppressWarnings("unlikely-arg-type")
	@GetMapping("/owners/groupB")
	public ResponseEntity<List<Owner>> getAllOwnersB() {
		List<Owner> owners = ownerService.findAll();
		return ResponseEntity.ok(owners.stream()
				.filter(owner -> owner.getName().equals("Dada Mane") || owner.getName().equals("Pankaj Mokashi") || owner.getName().equals("Akash Desai") || owner.getName().equals("Kumar Pawar"))
	            .collect(Collectors.toList()));
	}
}
