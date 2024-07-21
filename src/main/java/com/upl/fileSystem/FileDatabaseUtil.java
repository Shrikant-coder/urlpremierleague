package com.upl.fileSystem;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;

public class FileDatabaseUtil<T> {

    private final String filePath;
    private final ObjectMapper objectMapper;
    private final Class<T> typeParameterClass;

    public FileDatabaseUtil(String filePath, Class<T> typeParameterClass) {
        this.filePath = filePath;
        this.typeParameterClass = typeParameterClass;
        this.objectMapper = new ObjectMapper();
        createDirectoryIfNotExists();
    }

    public List<T> readFromFile() {
        try {
            File file = new File(filePath);
            if (!file.exists()) {
                return List.of();
            }
            CollectionType listType = objectMapper.getTypeFactory().constructCollectionType(List.class, typeParameterClass);
            return objectMapper.readValue(file, listType);
        } catch (IOException e) {
            throw new RuntimeException("Failed to read data from file: " + filePath, e);
        }
    }

    public void writeToFile(List<T> data) {
        try {
            objectMapper.writeValue(new File(filePath), data);
        } catch (IOException e) {
            throw new RuntimeException("Failed to write data to file: " + filePath, e);
        }
    }

    private void createDirectoryIfNotExists() {
        File file = new File(filePath);
        File directory = file.getParentFile();
        if (directory != null && !directory.exists()) {
            directory.mkdirs();
        }
    }
}