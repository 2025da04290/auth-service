package com.vk.authservice.repository;

import com.vk.authservice.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByUsername(String username);

    Optional<User> findByUsernameAndEnabled(String username, Boolean enabled);

    boolean existsByUsername(String username);

    boolean existsByEmail(String email);
}
