package com.upl.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.upl.model.Owner;
import com.upl.model.Player;
import com.upl.repository.OwnerRepository;
import com.upl.repository.PlayerRepository;

import ch.qos.logback.core.model.Model;
import jakarta.transaction.Transactional;

@Controller
@RequestMapping("/owner")
public class OwnerController {

	@Autowired
	private OwnerRepository ownerService;

	@Autowired
	private PlayerRepository playerService;

	@GetMapping("/owners")
	public ResponseEntity<List<Owner>> getAllOwners() {
		List<Owner> owners = ownerService.findAll();
		Player defaultCaptain = new Player();
		defaultCaptain.setName("<NOT SET>");
		List<Owner> finalList = owners.stream().filter(owner -> owner.getCaptain() == null)
				.peek(owner -> owner.setCaptain(defaultCaptain)).collect(Collectors.toList());
		return ResponseEntity.ok(owners);
	}


}
