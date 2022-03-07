package com.tablegame.model.bean.meals;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface MealListRepository extends JpaRepository<MealList, Integer> {
	
	@Query("FROM MealList WHERE fk_order_id = :fk_order_id")//Hibernate的HQL語法
	public List<MealList> findByOrderId(@Param(value = "fk_order_id") Integer id);
	
	


}
