package com.coursejava.course.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coursejava.course.entities.OrderItem;
import com.coursejava.course.entities.pk.OrderItemPk;

public interface OrderItemRepository extends JpaRepository<OrderItem, OrderItemPk>{

}
