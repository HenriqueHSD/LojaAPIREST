package com.coursejava.course.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coursejava.course.entities.User;
import org.springframework.security.core.userdetails.UserDetails;

public interface UserRepository extends JpaRepository<User, Long>{

    UserDetails findByEmail(String email);

}
