package com.tablegame.controller.meals;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.meals.MealList;
import com.tablegame.model.bean.meals.MealListRepository;
import com.tablegame.service.meals.FoodListService;
import com.tablegame.service.meals.MealListService;
import com.tablegame.service.meals.MealOrdersService;

@Controller
public class MealListController {
	
	@Autowired
	private MealListRepository dao;
	
	@Autowired
	private MealListService mealService;
	
	@Autowired
	private FoodListService foodService;
	
	@Autowired
	private MealOrdersService ordersService;
	
	@PostMapping(value="/addMealItem")                  //@Valid 參考網址:http://www.mydlq.club/article/49/
	public ModelAndView postNewMealItem(ModelAndView mav,@Valid @ModelAttribute(name = "mealItem") MealList mealItem, BindingResult rs) {
		
//		MealList mealList = new MealList();
//		mealList.setFoodList(foodService.findById(id));
		
		
		if(!rs.hasErrors()) {
			mealService.insert(mealItem);
			MealList newMealItem = new MealList();
			mav.getModel().put("newMealItem", newMealItem);
		}
		
//		Page<FoodList> page = service.findByPage(pageNumber);
//		mav.getModel().put("page", page);
		mav.setViewName("redirect:/mealList");

		return mav;
	}
	
	

}
