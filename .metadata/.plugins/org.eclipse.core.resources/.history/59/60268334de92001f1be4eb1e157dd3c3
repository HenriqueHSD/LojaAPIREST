package com.coursejava.course.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coursejava.course.entities.Category;
import com.coursejava.course.repositories.CategoryRepository;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryRepository repository;
	
	public List<Category> finAll(){
		return repository.findAll();
	}
	
	public Category findByid(Long id) {
		Optional<Category> obj = repository.findById(id);
		return obj.get();
	}

}
