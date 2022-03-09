package com.tablegame.service.meals;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.meals.FoodList;
import com.tablegame.model.bean.meals.MealOrders;
import com.tablegame.model.bean.meals.MealOrdersRepository;

@Service
public class MealOrdersService {
	
	@Autowired
	private MealOrdersRepository dao;
	
	public void insert(MealOrders orders) {
		dao.save(orders);
	}
	
	
	public void delete(Integer orderId) {
		dao.deleteById(orderId);
	}
	
	
	public MealOrders findById(Integer orderId) {
		Optional<MealOrders> op = dao.findById(orderId); 
	    
		if(op.isPresent()) {
			return op.get();
		}
		  
		  return null;
	}
	
	
	
	public Page<MealOrders> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber -1, 10, Sort.Direction.ASC,"orderId");

		return dao.findAll(pgb);
	}
	
	public List<MealOrders> selectFoodTypeCountbyFoodName() {
		return dao.selectFoodTypeCountbyFoodName();
	}

	public List<Date> selectSamedate() {
		return dao.selectSamedate();
	}

}
