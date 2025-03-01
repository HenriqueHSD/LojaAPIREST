package com.coursejava.course.resource;

import com.coursejava.course.dto.AuthenticationDTO;
import com.coursejava.course.dto.LoginResponseDTO;
import com.coursejava.course.dto.RegisterDTO;
import com.coursejava.course.entities.User;
import com.coursejava.course.infra.security.TokenService;
import com.coursejava.course.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import jakarta.validation.Valid;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("auth")
public class AuthenticationResource {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    UserRepository repository;

    @Autowired
    private TokenService tokenService;


    @PostMapping("/login")
    public ResponseEntity login(@RequestBody @Valid AuthenticationDTO data){
        var usernamePassword = new UsernamePasswordAuthenticationToken(data.email(), data.password());
        var auth = this.authenticationManager.authenticate(usernamePassword);

        var token = tokenService.generateToken((User) auth.getPrincipal());

        return ResponseEntity.ok(new LoginResponseDTO(token));

    }

    @PostMapping("/register")
    public ResponseEntity register (@RequestBody @Valid RegisterDTO data){
if(this.repository.findByEmail(data.email()) != null) return ResponseEntity.badRequest().build();

String encryptedPassword = new BCryptPasswordEncoder().encode(data.password());
User newUser = new User(data.email(), encryptedPassword, data.role());

this.repository.save(newUser);

return ResponseEntity.ok().build();

    }

}
