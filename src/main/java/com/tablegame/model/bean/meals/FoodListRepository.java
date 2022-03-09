package com.tablegame.model.bean.meals;

import java.util.HashMap;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tablegame.model.bean.product.Item;

@Repository
public interface FoodListRepository extends JpaRepository<FoodList, Integer> {
	
	public List<FoodList> findByFoodName(String foodName);

//	public void save(String foodName, Integer foodPrice, String foodType, String foodImage);
	
	@Query(value = "select food_type from Foods where food_name=:food_name", nativeQuery = true)
	public String selectFoodTypeCountbyFoodName(@Param(value = "food_name") String productName);
	
	
	
	

}
