package com.example.demo.repository;
import com.example.demo.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
public interface MemberRepository extends JpaRepository<Member, String>{
    Optional<Member> findById(String id); // 사용자 ID로 사용자 찾기
}
