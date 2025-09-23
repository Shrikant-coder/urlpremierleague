package com.upl.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.upl.model.Owner;
import com.upl.model.Player;
import com.upl.model.Sponsor;
import com.upl.repository.OwnerRepository;
import com.upl.repository.Player2024Repository;
import com.upl.repository.PlayerRepository;
import com.upl.repository.SponsorRepository;

@RestController
@RequestMapping("/admin")
public class AdminController {

	 private final OwnerRepository ownerRepository;
	    private final PlayerRepository playerRepository;
	    private final Player2024Repository player2024Repository;
	    private final SponsorRepository sponsorRepository;

	    public AdminController(OwnerRepository ownerRepository, PlayerRepository playerRepository, SponsorRepository sponsorRepository,Player2024Repository player2024Repository) {
	        this.ownerRepository = ownerRepository;
	        this.playerRepository = playerRepository;
	        this.sponsorRepository = sponsorRepository;
	        this.player2024Repository = player2024Repository;
	    }
    
    @PostMapping("/addPlayer")
    public ResponseEntity<String> addPlayer(@RequestParam("name") String name,
                                            @RequestParam("role") String role,
                                            @RequestParam("village") String village,
                                            @RequestParam("image") MultipartFile imageFile) {
        try {
            byte[] imageBytes = imageFile.getBytes();
            List<Player> list=playerRepository.findAll();
            long id;
            if(list.isEmpty()) {
            	id=0;
            }else {
            	id=list.stream().max(Comparator.comparingLong(Player::getId)).get().getId();
            }
            Player player = new Player(id+1, name, role, village, imageBytes);
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
            List<Owner> list=ownerRepository.findAll();
            long id;
            if(list.isEmpty()) {
            	id=0;
            }else {
            	id=list.stream().max(Comparator.comparingLong(Owner::getId)).get().getId();
            }
            Owner owner = new Owner(id+1, name, null, imageBytes); // Assuming captain is null for now
            ownerRepository.save(owner);
            return ResponseEntity.ok("Owner added successfully!");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error processing image");
        }
    }

    @PostMapping("/addSponsor")
    public ResponseEntity<String> addSponsor(@RequestParam("name") String name,
                                             @RequestParam("post") String post,
                                             @RequestParam("amount") int amount,
                                             @RequestParam("image") MultipartFile imageFile) {
        try {
            byte[] imageBytes = imageFile.getBytes();
            List<Sponsor> list=sponsorRepository.findAll();
            long id;
            if(list.isEmpty()) {
            	id=0;
            }else {
            	id=list.stream().max(Comparator.comparingLong(Sponsor::getId)).get().getId();
            }
            Sponsor sponsor = new Sponsor(id+1, name, post, amount, imageBytes);
            sponsorRepository.save(sponsor);
            return ResponseEntity.ok("Sponsor added successfully!");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error processing image");
        }
    }



    @DeleteMapping("/deletePlayer/{id}")
    public ResponseEntity<String> deletePlayer(@PathVariable int id) {
        playerRepository.deleteById((long) id);
        return ResponseEntity.ok("Player deleted successfully!");
    }
    @GetMapping("/addPlayer2025/{id}")
    public ResponseEntity<String> addPlayer2025(@PathVariable int id) {
    	Optional<Player> p=player2024Repository.findAll().stream().filter(player -> Objects.equals(player.getId(), (long) id))
    	        .findFirst();
        if(p.isEmpty())
        	return ResponseEntity.ok("Player added failed");
        else {
        	playerRepository.save(p.get());
        	player2024Repository.deleteById(id);
        	return ResponseEntity.ok("Player added successfully");
        }
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

    @GetMapping("/players2024")
    public List<Player> players2024() {
    	List<Player> all=player2024Repository.findAll();
        return all;
    }
    
    @GetMapping("/dummy")
    public String players20242() {
    	List<Player> plall=new ArrayList<>();
    	Player p=new Player();
    	p.setName("Shrikant");
    	plall.add(p);
    	playerRepository.saveAll(plall);
    	List<Owner> olist=new ArrayList<>();
    	Owner o=new Owner();
    	o.setName("Shrikant");
    	olist.add(o);
    	ownerRepository.saveAll(olist);
   
    	List<Sponsor> slall=new ArrayList<>();
    	Sponsor s=new Sponsor();
    	s.setName("Shrikant");
    	
    	slall.add(s);
    	sponsorRepository.saveAll(slall);
        return "ok";
    }
    
    @GetMapping("/players")
    public List<Player> getPlayers() {
    	List<Player> all=playerRepository.findAll();
        return all;
    }
    @GetMapping("/owners")
    public List<Owner> getOwners() {
        return ownerRepository.findAll();
    }

    @GetMapping("/sponsors")
    public List<Sponsor> getSponsors() {
        return sponsorRepository.findAll().stream().sorted(Comparator.comparing(Sponsor::getAmount).reversed()).toList();
    }

    @PostMapping("/setCaptain")
    public ResponseEntity<?> setPlayerAsOwner(@RequestBody Map<String, Long> request) {
        Long ownerId = request.get("ownerId");
        Long playerId = request.get("playerId");

        Optional<Owner> ownerOpt = ownerRepository.findAll().stream().filter(o->o.getId()==ownerId).findAny();
        Optional<Player> playerOpt = playerRepository.findAll().stream().filter(p->p.getId()==playerId).findAny();

        if (ownerOpt.isPresent() && playerOpt.isPresent()) {
            Owner owner = ownerOpt.get();
            Player player = playerOpt.get();
            owner.setCaptain(player);
            ownerRepository.SetCaptainForOwner(owner);	
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Owner or Player not found");
        }
    }
}