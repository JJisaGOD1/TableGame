package com.tablegame.service.meals;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.meals.FoodItem;
import com.tablegame.model.bean.meals.FoodList;
import com.tablegame.model.bean.meals.FoodListRepository;
import com.tablegame.model.bean.meals.MealList;
import com.tablegame.model.bean.meals.MealListRepository;

@Service
public class CartService {
	
	
	@Autowired
	private MealListRepository mealDao;

	public void addFood(FoodList food, Map<Integer, FoodItem> foodMap) {
		// 獲取得到購物項
		FoodItem foodItem = foodMap.get(food.getFoodId());
		// 判斷購物車是否存在該購物項，如果不存在
		if (foodItem == null) {
			// 建立這購物車項物件
			foodItem = new FoodItem();
			// 將使用者傅遞過來的商品作為購物項
			foodItem.setFood(food);
			// 把該購物項的數量設定為1
			foodItem.setQuantity(1);
			// 把購物項加入到購物車去
			foodMap.put(food.getFoodId(), foodItem);
		}else {
			//如果存在該購物項，將購物項的數量+1
			foodItem.setQuantity(foodItem.getQuantity() + 1);
		}
	}
	
	public void deleteOneFoodItem(FoodList food, Map<Integer, FoodItem> foodMap) {
		foodMap.remove(food.getFoodId());
//		mealDao.deleteById(meal.getMealListId());
	}
	
	public void deleteOneFoodItem2(FoodList food, Map<Integer, FoodItem> foodMap) {
		foodMap.remove(food.getFoodId());
//		mealDao.deleteById(meal.getMealListId());
	}
	
//	public void deleteOneProduct(Product product, Map<Integer, CartItem> productMap) {
//		productMap.remove(product.getProduct_id());
//	}


}
