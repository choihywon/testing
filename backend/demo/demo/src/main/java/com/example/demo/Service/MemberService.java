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
        return memberRepository.save(member);
    }

    public Member findById(String id) {
        return memberRepository.findById(id).orElse(null);
    }

    public Member updateMember(Member member) {
        Member existingMember = findById(member.getId());
        if (existingMember != null) {
            if (member.getPassword() != null && !member.getPassword().isEmpty()) {
                existingMember.setPassword(member.getPassword());  // 암호화를 제거하고 비밀번호를 직접 설정합니다.
            }
            existingMember.setUsername(member.getUsername());
            existingMember.setUserEmail(member.getUserEmail());
            existingMember.setPhoneNumber(member.getPhoneNumber());
            existingMember.setGender(member.getGender());
            existingMember.setAge(member.getAge());
            return memberRepository.save(existingMember);
        }
        return null;
    }
}

