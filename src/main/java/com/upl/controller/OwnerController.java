package com.upl.controller;

import java.util.List;
import java.util.stream.Collectors;

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
	@SuppressWarnings("unlikely-arg-type")
	@GetMapping("/owners/groupA")
	public ResponseEntity<List<Owner>> getAllOwnersA() {
		List<Owner> owners = ownerService.findAll();
		 List<Integer> filterIds = List.of(5, 10, 11, 12);
		return ResponseEntity.ok(owners.stream()
	            .filter(owner -> owner.getId() == 5 || owner.getId() == 10 || owner.getId() == 11 || owner.getId() == 12)
	            .collect(Collectors.toList()));
	}
	@SuppressWarnings("unlikely-arg-type")
	@GetMapping("/owners/groupB")
	public ResponseEntity<List<Owner>> getAllOwnersB() {
		List<Owner> owners = ownerService.findAll();
		 List<Integer> filterIds = List.of(5, 10, 11, 12);
		return ResponseEntity.ok(owners.stream()
	            .filter(owner -> owner.getId() == 6 || owner.getId() == 7 || owner.getId() == 8 || owner.getId() == 13)
	            .collect(Collectors.toList()));
	}
}
