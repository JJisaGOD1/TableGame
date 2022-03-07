package com.tablegame.service.meals;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.meals.FoodList;
import com.tablegame.model.bean.meals.FoodListRepository;
import com.tablegame.model.bean.meals.MealList;
import com.tablegame.model.bean.meals.MealListRepository;
import com.tablegame.model.bean.meals.MealOrders;
import com.tablegame.model.bean.meals.MealOrdersRepository;

@Service
public class MealListService {

	@Autowired
	private MealListRepository dao;

	@Autowired
	private FoodListRepository foodDao;
	
	@Autowired
	private MealOrdersRepository orderDao;

	public void insert(MealList mealList) {
		dao.save(mealList);
	}

	public void findFoodByFoodId(Integer foodId) {

		// 抓到單筆食物資料
		Optional<FoodList> op = foodDao.findById(foodId);

		MealList mealList = new MealList();
		mealList.setFoodList(op.get());

	}


	public List<MealList> findMealByOrderId(MealOrders newOrders) {

		// 抓到訂單資料
		Optional<MealOrders> op = orderDao.findById(newOrders.getOrderId());
		
		List<MealList> orderId = dao.findByOrderId(op.get().getOrderId());
		
		if(op.isPresent()) {
			return orderId;
		}
		  
		  return null;

	}
	
	public MealList createbean(MealOrders orders, FoodList foodList, Double itemPrice ,Integer quantity) {
		MealList mealList = new MealList();
		mealList.setOrders(orders);
		mealList.setFoodList(foodList);
		mealList.setItemPrice(itemPrice);
		mealList.setQuantity(quantity);
		
		return mealList;
	}
	
	public void delete(Integer foodId) {
		dao.deleteById(foodId);
	}
	
	public MealList findById(Integer id) {
		Optional<MealList> op = dao.findById(id); 
	    
		if(op.isPresent()) {
			return op.get();
		}
		  
		  return null;
	}
	

}
