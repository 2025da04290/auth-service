package com.vk.authservice.service;

import com.vk.authservice.dto.AuthRequest;
import com.vk.authservice.dto.AuthResponse;
import com.vk.authservice.exception.AuthenticationException;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    private final JwtService jwtService;

    public AuthService(JwtService jwtService) {
        this.jwtService = jwtService;
    }

    public AuthResponse authenticate(AuthRequest request) {
        if (!isValidCredentials(request.getUsername(), request.getPassword())) {
            throw new AuthenticationException("Invalid username or password");
        }

        String token = jwtService.generateToken(request.getUsername());

        return AuthResponse.builder()
                .accessToken(token)
                .tokenType("Bearer")
                .expiresIn(jwtService.getExpiration() / 1000)
                .username(request.getUsername())
                .build();
    }

    private boolean isValidCredentials(String username, String password) {
        return "admin".equals(username) && "admin123".equals(password);
    }
}
