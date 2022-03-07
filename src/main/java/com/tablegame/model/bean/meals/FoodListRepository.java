package com.tablegame.model.bean.meals;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface FoodListRepository extends JpaRepository<FoodList, Integer> {
	
	public List<FoodList> findByFoodName(String foodName);

//	public void save(String foodName, Integer foodPrice, String foodType, String foodImage);
	


}
