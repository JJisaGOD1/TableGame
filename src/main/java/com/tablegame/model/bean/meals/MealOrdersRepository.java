package com.tablegame.model.bean.meals;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface MealOrdersRepository extends JpaRepository<MealOrders, Integer> {
	
}
