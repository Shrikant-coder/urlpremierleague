package com.upl.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.upl.model.Sponsor;
import com.upl.repository.SponsorRepository;

@RestController("/sponsors")
public class SponserController {

	@Autowired
	private SponsorRepository sponsorService;

	@GetMapping("/sponsors")
	public List<Sponsor> getAllSponsor() {
		List<Sponsor> list=sponsorService.findAll();
		Collections.sort(list,Comparator.comparing(Sponsor::getAmount).reversed());
		return list;
	}

	@PostMapping("/addSponsor")
	public ResponseEntity<String> addSponsor(@RequestBody Sponsor sponsor) {
		sponsorService.save(sponsor);
		return ResponseEntity.ok("Sponsor added successfully!");
	}

	@DeleteMapping("/deleteSponsor/{id}")
	public ResponseEntity<String> deleteSponsor(@PathVariable("id") Long sponsorId) {
		sponsorService.deleteById(sponsorId);
		return ResponseEntity.ok("Sponsor deleted successfully!");
	}
}
