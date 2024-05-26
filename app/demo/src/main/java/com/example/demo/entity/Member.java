package com.example.demo.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "MEMBER")
public class Member {
    @Id
    @Column(name = "ID")
    private String id;

    @Column(name = "USERNAME")
    private String username;

    @Column(name = "PASSWORD", length = 255) // 비밀번호 길이를 255로 설정
    private String password;

    @Column(name = "GENDER")
    private String gender;

    @Column(name = "PHONE_NUMBER")
    private String phoneNumber;

    @Column(name = "AGE")
    private int age;

    @Column(name = "USER_EMAIL")
    private String userEmail;

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }
}
