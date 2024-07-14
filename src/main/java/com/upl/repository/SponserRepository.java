package com.upl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.upl.model.Player;
import com.upl.model.Sponsor;
@Repository
public interface SponserRepository extends JpaRepository<Sponsor, Long> {

}
