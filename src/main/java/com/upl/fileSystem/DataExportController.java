package com.upl.fileSystem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/export")
public class DataExportController {

    @Autowired
    private DataExportService dataExportService;

    @GetMapping
    public String exportData() {
        dataExportService.exportData();
        return "Data export completed.";
    }
}