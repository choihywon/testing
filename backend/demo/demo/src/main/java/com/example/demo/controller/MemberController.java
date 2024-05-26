package com.example.demo.controller;

import com.example.demo.entity.Member;
import com.example.demo.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
@RestController
@RequestMapping("/api/members")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Member member) {
        Member existingMember = memberService.findById(member.getId());
        if (existingMember != null && member.getPassword().equals(existingMember.getPassword())) {
            return ResponseEntity.ok(existingMember);
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials");
        }
    }

    @PostMapping("/signup")
    public ResponseEntity<?> addMember(@RequestBody Member member) {
        try {
            Member savedMember = memberService.saveMember(member);
            return new ResponseEntity<>(savedMember, HttpStatus.CREATED);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred: " + e.getMessage());
        }
    }

    @GetMapping("/me")
    public ResponseEntity<Member> getUserInfo(@RequestParam String id) {
        Member member = memberService.findById(id);
        return ResponseEntity.ok(member);
    }

    @PutMapping("/update")
    public ResponseEntity<?> updateMember(@RequestBody Member member) {
        try {
            Member updatedMember = memberService.updateMember(member);
            return ResponseEntity.ok(updatedMember);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred: " + e.getMessage());
        }
    }
}
