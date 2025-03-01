package com.coursejava.course.dto;

import com.coursejava.course.entities.enums.UserRole;

public record RegisterDTO(String email, String password, UserRole role) {
}
