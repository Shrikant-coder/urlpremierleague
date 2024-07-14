package com.upl.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.upl.model.Owner;

@Repository
public interface OwnerRepository extends JpaRepository<Owner, Long>{

	List<Owner> findAll();

}
