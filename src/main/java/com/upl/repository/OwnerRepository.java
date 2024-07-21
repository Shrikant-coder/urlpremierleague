package com.upl.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.upl.fileSystem.FileDatabaseConfig;
import com.upl.fileSystem.FileDatabaseUtil;
import com.upl.model.Owner;

@Repository
public class OwnerRepository {

    private final FileDatabaseUtil<Owner> fileDatabaseUtil;

    public OwnerRepository(@Value("${file.owner-file-path}") String filePath) {
        this.fileDatabaseUtil = new FileDatabaseUtil<>(filePath, Owner.class);
    }

    public List<Owner> findAll() {
        return fileDatabaseUtil.readFromFile();
    }

    public void saveAll(List<Owner> owners) {
        fileDatabaseUtil.writeToFile(owners);
    }

    public void save(Owner owner) {
        List<Owner> owners = findAll();
        owners.add(owner);
        saveAll(owners);
    }

    public void deleteById(long id) {
        List<Owner> owners = findAll();
        owners.removeIf(owner -> owner.getId() == id);
        saveAll(owners);
    }
}
