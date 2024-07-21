package com.upl.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.upl.fileSystem.FileDatabaseConfig;
import com.upl.fileSystem.FileDatabaseUtil;
import com.upl.model.Sponsor;
@Repository
public class SponsorRepository {

    private final FileDatabaseUtil<Sponsor> fileDatabaseUtil;

    public SponsorRepository(@Value("${file.sponsor-file-path}") String filePath) {
        this.fileDatabaseUtil = new FileDatabaseUtil<>(filePath, Sponsor.class);
    }

    public List<Sponsor> findAll() {
        return fileDatabaseUtil.readFromFile();
    }

    public void saveAll(List<Sponsor> sponsors) {
        fileDatabaseUtil.writeToFile(sponsors);
    }

    public void save(Sponsor sponsor) {
        List<Sponsor> sponsors = findAll();
        sponsors.add(sponsor);
        saveAll(sponsors);
    }

    public void deleteById(long id) {
        List<Sponsor> sponsors = findAll();
        sponsors.removeIf(sponsor -> sponsor.getId() == id);
        saveAll(sponsors);
    }
}