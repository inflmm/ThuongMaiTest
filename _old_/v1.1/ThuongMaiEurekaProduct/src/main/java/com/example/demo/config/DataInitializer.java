package com.example.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {
        if (userRepository.findByUsername("admin").isEmpty()) {
            User admin = new User();
            admin.setUsername("admin");
            admin.setPassword(passwordEncoder.encode("123456"));
            admin.setRole("ROLE_ADMIN");
            userRepository.save(admin);
            System.out.println("Đã tạo tài khoản admin mẫu: admin / 123456");
        }

        if (userRepository.findByUsername("0912345678").isEmpty()) {
            User user = new User();
            user.setUsername("0912345678");
            user.setPhoneNumber("0912345678");
            user.setPassword(passwordEncoder.encode("123456"));
            user.setRole("ROLE_USER");
            userRepository.save(user);
            System.out.println("Đã tạo tài khoản khách mẫu: 0912345678 / 123456");
        }
    }
}