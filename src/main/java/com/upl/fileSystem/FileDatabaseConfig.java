package com.upl.fileSystem;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "file")
public class FileDatabaseConfig {

    private String ownerFilePath;
    private String playerFilePath;
    private String sponsorFilePath;
    private String player2024FilePath;

    // Getters and Setters
    public String getOwnerFilePath() {
        return ownerFilePath;
    }

    public void setOwnerFilePath(String ownerFilePath) {
        this.ownerFilePath = ownerFilePath;
    }

    public String getPlayerFilePath() {
        return playerFilePath;
    }

    public void setPlayerFilePath(String playerFilePath) {
        this.playerFilePath = playerFilePath;
    }

    public String getSponsorFilePath() {
        return sponsorFilePath;
    }

    public void setSponsorFilePath(String sponsorFilePath) {
        this.sponsorFilePath = sponsorFilePath;
    }

	public String getPlayer2024FilePath() {
		return player2024FilePath;
	}

	public void setPlayer2024FilePath(String player2024FilePath) {
		this.player2024FilePath = player2024FilePath;
	}
    
}
