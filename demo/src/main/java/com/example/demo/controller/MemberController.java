package com.example.demo.controller;
import com.example.demo.entity.Member;
import com.example.demo.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/members")
public class MemberController {
//    @Autowired
//    private MemberService memberService;
//
//    @PostMapping("/")
//    public ResponseEntity<Member> addMember(@RequestBody Member member) {
//        Member savedMember = memberService.saveMember(member);
//        return new ResponseEntity<>(savedMember, HttpStatus.CREATED);
//    }
    @Autowired
    private MemberService memberService;

    @PostMapping
    public String addMember(
            @RequestParam("id") String id,
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("gender") String gender,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam("age") int age,
            @RequestParam("userEmail") String userEmail,
            RedirectAttributes redirectAttributes) {

        Member member = new Member();
        member.setId(id);
        member.setUsername(username);
        member.setPassword(password);
        member.setGender(gender);
        member.setPhoneNumber(phoneNumber);
        member.setAge(age);
        member.setUserEmail(userEmail);

        memberService.saveMember(member);
        redirectAttributes.addFlashAttribute("message", "회원가입이 성공적으로 완료되었습니다.");
        return "redirect:/login";
    }
}
