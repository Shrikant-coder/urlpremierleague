package com.upl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.upl.model.Player;
import com.upl.repository.PlayerRepository;

@RestController
@RequestMapping("/player")
public class PlayerController {

	@Autowired
	private PlayerRepository playerService;

	@GetMapping("/players")
	public ResponseEntity<List<Player>> getAllplayers() {
		return ResponseEntity.ok(playerService.findAll());
	}
	@PostMapping("/addPlayer")
	public ResponseEntity<String> addPlayer(@RequestBody Player player) {
		playerService.save(player);
		return ResponseEntity.ok("Player added successfully!");
	}

	@DeleteMapping("/deletePlayer/{id}")
	public ResponseEntity<String> deletePlayer(@PathVariable Long id) {
		playerService.deleteById(id);
		return ResponseEntity.ok("Player deleted successfully!");
	}
}
