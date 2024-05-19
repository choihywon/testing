package com.example.demo.Service;
import com.example.demo.entity.Member;
import com.example.demo.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public Member saveMember(Member member) {
        // 비밀번호 암호화
        member.setPassword(new BCryptPasswordEncoder().encode(member.getPassword()));
        return memberRepository.save(member);
    }
}
