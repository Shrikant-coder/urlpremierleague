package com.upl.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.upl.fileSystem.FileDatabaseUtil;
import com.upl.model.Player;

@Repository
public class Player2024Repository {

    private final FileDatabaseUtil<Player> fileDatabaseUtil;

    public Player2024Repository(@Value("${file.player2024-file-path}") String filePath) {
        this.fileDatabaseUtil = new FileDatabaseUtil<>(filePath, Player.class);
    }

    public List<Player> findAll() {
        return fileDatabaseUtil.readFromFile();
    }

    public void saveAll(List<Player> players) {
        fileDatabaseUtil.writeToFile(players);
    }

    public void save(Player player) {
        List<Player> players = findAll();
        players.add(player);
        saveAll(players);
    }

    public void deleteById(long id) {
        List<Player> players = findAll();
        players.removeIf(player -> player.getId() == id);
        saveAll(players);
    }
}
