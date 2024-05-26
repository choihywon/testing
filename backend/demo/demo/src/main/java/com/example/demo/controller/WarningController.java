package com.example.demo.controller;

import com.example.demo.entity.Warning;
import com.example.demo.repository.WarningRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@RestController
@RequestMapping("/api")
public class WarningController {

    @Autowired
    private WarningRepository warningRepository;

    @PostMapping("/warning")
    public Warning receiveWarning(@RequestBody WarningRequest warningRequest) {
        System.out.println("Received warning request: " + warningRequest);

        Warning warning = new Warning();
        warning.setId(warningRequest.getRecordId()); // 요청에서 받은 ID 사용
        warning.setUserId(warningRequest.getUserId());
        warning.setDates(LocalDateTime.parse(warningRequest.getTimestamp(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

        Warning savedWarning = warningRepository.save(warning);
        System.out.println("Saved warning: " + savedWarning);
        return savedWarning;
    }
}