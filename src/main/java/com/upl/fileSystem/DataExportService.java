package com.upl.fileSystem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.upl.model.Owner;
import com.upl.model.Player;
import com.upl.model.Sponsor;
import com.upl.repository.OwnerRepository;
import com.upl.repository.PlayerRepository;
import com.upl.repository.SponsorRepository;

@Service
public class DataExportService {

    @Autowired
    private OwnerRepository ownerRepository;

    @Autowired
    private PlayerRepository playerRepository;

    @Autowired
    private SponsorRepository sponsorRepository;

    @Autowired
    private FileDatabaseConfig config;

    public void exportData() {
        exportOwners();
        exportPlayers();
        exportSponsors();
    }

    private void exportOwners() {
        List<Owner> owners = ownerRepository.findAll();
        FileDatabaseUtil<Owner> fileDatabaseUtil = new FileDatabaseUtil<>(config.getOwnerFilePath(), Owner.class);
        fileDatabaseUtil.writeToFile(owners);
    }

    private void exportPlayers() {
        List<Player> players = playerRepository.findAll();
        FileDatabaseUtil<Player> fileDatabaseUtil = new FileDatabaseUtil<>(config.getPlayerFilePath(), Player.class);
        fileDatabaseUtil.writeToFile(players);
    }

    private void exportSponsors() {
        List<Sponsor> sponsors = sponsorRepository.findAll();
        FileDatabaseUtil<Sponsor> fileDatabaseUtil = new FileDatabaseUtil<>(config.getSponsorFilePath(), Sponsor.class);
        fileDatabaseUtil.writeToFile(sponsors);
    }
}