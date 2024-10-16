package com.coursejava.course.resource;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.coursejava.course.entities.User;

@RestController
@RequestMapping(value = "/users")
public class UserResource {
	
	@GetMapping
	public ResponseEntity<User> teste(){
		User u = new User(1L, "Mario", "mariobrown@gmail.com", "12132324", "mymario123");
		return ResponseEntity.ok().body(u);
	}

}
