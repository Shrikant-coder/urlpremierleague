package com.upl.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.upl.model.Owner;
import com.upl.model.Player;
import com.upl.repository.OwnerRepository;


@Controller
@RequestMapping("/owner")
public class OwnerController {

	@Autowired
	private OwnerRepository ownerService;


	@GetMapping("/owners")
	public ResponseEntity<List<Owner>> getAllOwners() {
		List<Owner> owners = ownerService.findAll();
		Player defaultCaptain = new Player();
		defaultCaptain.setName("<NOT SET>");
		return ResponseEntity.ok(owners);
	}


}
