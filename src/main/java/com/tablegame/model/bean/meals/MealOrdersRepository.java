package com.tablegame.model.bean.meals;



import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface MealOrdersRepository extends JpaRepository<MealOrders, Integer> {
	
	@Query(value = "select convert(varchar,order_date, 10) as orderDate,SUM(totalprice) as totalprice FROM MealOrders GROUP BY convert(varchar,order_date, 10)", nativeQuery = true)
	public List<MealOrders> selectFoodTypeCountbyFoodName();
	
	@Query(value = "select convert(varchar,order_date, 10) FROM MealOrders GROUP BY convert(varchar,order_date, 10)", nativeQuery = true)
	public List<Date> selectSamedate();
}
