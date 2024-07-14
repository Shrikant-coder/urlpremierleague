package com.upl.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.upl.model.Owner;
import com.upl.model.Player;
import com.upl.model.Sponsor;
import com.upl.model.Users;
import com.upl.repository.OwnerRepository;
import com.upl.repository.PlayerRepository;
import com.upl.repository.SponserRepository;
import com.upl.repository.UserRepository;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private PlayerRepository playerRepository;

    @Autowired
    private OwnerRepository ownerRepository;

    @Autowired
    private SponserRepository sponsorRepository;

    @Autowired
    private UserRepository userRepository;
    
    @GetMapping("/addShrikant")
	public String addShrikant() {
		Users user=new Users(0, "shreeja", "shreeja", "admin");
		userRepository.save(user);
		return "shreeja";
	}
    @PostMapping("/addPlayer")
    public ResponseEntity<String> addPlayer(@RequestParam("name") String name,
                                            @RequestParam("role") String role,
                                            @RequestParam("village") String village,
                                            @RequestParam("image") MultipartFile imageFile) {
        try {
            byte[] imageBytes = imageFile.getBytes();
            Player player = new Player(0, name, role, village, imageBytes);
            playerRepository.save(player);
            return ResponseEntity.ok("Player added successfully!");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error processing image");
        }
    }

    @PostMapping("/addOwner")
    public ResponseEntity<String> addOwner(@RequestParam("name") String name,
                                           @RequestParam("image") MultipartFile imageFile) {
        try {
            byte[] imageBytes = imageFile.getBytes();
            Owner owner = new Owner(0, name, null, imageBytes); // Assuming captain is null for now
            ownerRepository.save(owner);
            return ResponseEntity.ok("Owner added successfully!");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error processing image");
        }
    }

    @PostMapping("/addSponsor")
    public ResponseEntity<String> addSponsor(@RequestParam("name") String name,
                                             @RequestParam("post") String post,
                                             @RequestParam("amount") String amount,
                                             @RequestParam("image") MultipartFile imageFile) {
        try {
            byte[] imageBytes = imageFile.getBytes();
            Sponsor sponsor = new Sponsor(0, name, post, amount, imageBytes);
            sponsorRepository.save(sponsor);
            return ResponseEntity.ok("Sponsor added successfully!");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error processing image");
        }
    }

    @PostMapping("/addUser")
    public ResponseEntity<String> addUser(@RequestParam("username") String username,
                                          @RequestParam("password") String password,
                                          @RequestParam("role") String role) {
        try {
            Users user = new Users(0, username, password, role);
            userRepository.save(user);
            return ResponseEntity.ok("User added successfully!");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error adding user");
        }
    }

    @DeleteMapping("/deletePlayer/{id}")
    public ResponseEntity<String> deletePlayer(@PathVariable int id) {
        playerRepository.deleteById((long) id);
        return ResponseEntity.ok("Player deleted successfully!");
    }

    @DeleteMapping("/deleteOwner/{id}")
    public ResponseEntity<String> deleteOwner(@PathVariable int id) {
        ownerRepository.deleteById((long) id);
        return ResponseEntity.ok("Owner deleted successfully!");
    }

    @DeleteMapping("/deleteSponsor/{id}")
    public ResponseEntity<String> deleteSponsor(@PathVariable int id) {
        sponsorRepository.deleteById((long) id);
        return ResponseEntity.ok("Sponsor deleted successfully!");
    }

    @DeleteMapping("/deleteUser/{id}")
    public ResponseEntity<String> deleteUser(@PathVariable int id) {
        userRepository.deleteById((long) id);
        return ResponseEntity.ok("User deleted successfully!");
    }

    @GetMapping("/players")
    public List<Player> getPlayers() {
        return playerRepository.findAll();
    }

    @GetMapping("/owners")
    public List<Owner> getOwners() {
        return ownerRepository.findAll();
    }

    @GetMapping("/sponsors")
    public List<Sponsor> getSponsors() {
        return sponsorRepository.findAll();
    }

    @GetMapping("/users")
    public List<Users> getUsers() {
        return userRepository.findAll();
    }

    @PostMapping("/setCaptain")
    public ResponseEntity<?> setPlayerAsOwner(@RequestBody Map<String, Long> request) {
        Long ownerId = request.get("ownerId");
        Long playerId = request.get("playerId");

        Optional<Owner> ownerOpt = ownerRepository.findById(ownerId);
        Optional<Player> playerOpt = playerRepository.findById(playerId);

        if (ownerOpt.isPresent() && playerOpt.isPresent()) {
            Owner owner = ownerOpt.get();
            Player player = playerOpt.get();
            owner.setCaptain(player);
            ownerRepository.save(owner);
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Owner or Player not found");
        }
    }
}