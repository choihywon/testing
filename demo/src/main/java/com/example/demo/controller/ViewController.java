package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
    @GetMapping("/signup")
    public String signupForm() {
        return "signupPage"; // "signupPage" 템플릿을 반환
    }

    @GetMapping("/login")
    public String loginForm() {
        return "loginPage"; // "loginPage" 템플릿을 반환
    }

    @GetMapping("/home")
    public String home() {
        return "homePage"; // "home" 템플릿을 반환
    }
}
