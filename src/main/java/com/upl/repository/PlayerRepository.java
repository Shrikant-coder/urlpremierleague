package com.upl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.upl.model.Owner;
import com.upl.model.Player;
@Repository
public interface PlayerRepository extends JpaRepository<Player, Long>{

}
