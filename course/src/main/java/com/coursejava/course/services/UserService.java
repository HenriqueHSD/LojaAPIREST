package com.coursejava.course.services;

import com.coursejava.course.entities.User;
import com.coursejava.course.repositories.UserRepository;
import com.coursejava.course.services.exceptions.DatabaseException;
import com.coursejava.course.services.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository repository;

    public List<User> finAll() {
        return repository.findAll();
    }

    public User findByid(Long id) {
        Optional<User> obj = repository.findById(id);
        return obj.orElseThrow(() -> new ResourceNotFoundException(id));
    }

    public User insert(User obj) {
        return repository.save(obj);
    }

    public void delete(Long id) {
        repository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException(id));
        try {
            repository.deleteById(id);
        } catch (DataIntegrityViolationException e) {
            throw new DatabaseException(e.getMessage());
        }


    }

    public User update(Long id, User obj) {
        try {
            User entity = repository.getReferenceById(id);
            updateDate(entity, obj);
            return repository.save(entity);
        } catch (EntityNotFoundException e) {

            throw new ResourceNotFoundException(id);

        }
    }

    private void updateDate(User entity, User obj) {
        entity.setName(obj.getName());
        entity.setEmail(obj.getEmail());
        entity.setPhone(obj.getPhone());

    }

}
