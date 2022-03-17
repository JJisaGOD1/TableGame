package com.tablegame.controller.meals;

import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.apache.catalina.valves.rewrite.Substitution.MapElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.meals.FoodItem;
import com.tablegame.model.bean.meals.FoodList;
import com.tablegame.model.bean.meals.FoodListRepository;
import com.tablegame.model.bean.meals.MealList;
import com.tablegame.model.bean.meals.MealOrders;
import com.tablegame.model.bean.meals.OrderCart;
import com.tablegame.service.meals.CartService;
import com.tablegame.service.meals.FoodListService;
import com.tablegame.service.meals.MealListService;
import com.tablegame.service.meals.MealOrdersService;

@Controller
public class MealCartController {

	@Autowired
	private FoodListRepository dao;

	@Autowired
	private CartService cartService;

	@Autowired
	private FoodListService foodService;

	@Autowired
	private MealListService mealListService;

	@Autowired
	private MealOrdersService oService;

	@GetMapping(value = "/addToCart") // @Valid 參考網址:http://www.mydlq.club/article/49/
	public ModelAndView postNewMessage(ModelAndView mav, @RequestParam(name = "foodId") Integer foodId,
			BindingResult rs, HttpSession session, OrderCart cart) {

		OrderCart c = (OrderCart) session.getAttribute("cart");
		if (c == null) {
			session.setAttribute("cart", cart);
		}
		OrderCart cart2 = (OrderCart) session.getAttribute("cart");
		Map<Integer, FoodItem> foodMap = cart2.getFoodMap();
		FoodList food = foodService.findById(foodId);

		cartService.addFood(food, foodMap);
		
//		OrderCart cart = (OrderCart) session.getAttribute("cart");

		mav.setViewName("redirect:/meals/menu");

		return mav;
	}

	@GetMapping(value = "/goToCart")
	public ModelAndView cartImformation(ModelAndView mav, HttpSession session) {
		OrderCart cart = (OrderCart) session.getAttribute("cart");

		MealOrders newOrders = (MealOrders) session.getAttribute("orders");

		mav.addObject("newOrders", newOrders);
		mav.addObject("C", cart);
		mav.setViewName("meals/messages/Cart");
		return mav;
	}

	@GetMapping(value = "/checkOrder")
	public ModelAndView checkOrder(ModelAndView mav, HttpSession session) {
		OrderCart cart = (OrderCart) session.getAttribute("cart");
		MealOrders newOrders = (MealOrders) session.getAttribute("orders");
		if(newOrders == null || cart == null) {
			mav.setViewName("meals/messages/notExistOrder");
			return mav;
		}else {
			Map<Integer, FoodItem> foodMap = cart.getFoodMap();

			for (Entry<Integer, FoodItem> entry : foodMap.entrySet()) {
				FoodItem fooditem = entry.getValue();
				MealList mealList = mealListService.createbean(newOrders, fooditem.getFood(), fooditem.getPrice(),
						fooditem.getQuantity());

				mealListService.insert(mealList);

			}

			Integer orderId = newOrders.getOrderId();
			MealOrders meal = oService.findById(orderId);
			
			
			newOrders.setTableNum(newOrders.getTableNum());
			newOrders.setPeopleNum(newOrders.getPeopleNum());
			newOrders.setOrderDate(newOrders.getOrderDate());
			newOrders.setProcessState(newOrders.getProcessState());
			newOrders.setPaymentState(newOrders.getPaymentState());
			newOrders.setTotalprice(cart.getTotalPrices() + meal.getTotalprice());
			oService.insert(newOrders);

//			foodMap.clear();
			mav.addObject("newOrders", newOrders);
			mav.addObject("cart", cart);
//			newOrders.setTotalprice(cart.getTotalPrices());
			mav.setViewName("meals/messages/finishedOrder");

			return mav;
			
		}

		
	}

//	@GetMapping("/deleteFoodItem")
//	public ModelAndView deleteFoodItem2(ModelAndView mav, @RequestParam("foodId") Integer foodId) {
//		mealListService.delete(foodId);
//		
//		mav.setViewName("redirect:/Cart");
//		
//		return mav;
//		
//	}

	@GetMapping(value = "/deleteFoodItem") // @Valid 參考網址:http://www.mydlq.club/article/49/
	public ModelAndView deleteFoodItem(ModelAndView mav, @RequestParam(name = "foodId") Integer foodId,
			BindingResult rs, HttpSession session, OrderCart cart) {

		OrderCart c = (OrderCart) session.getAttribute("cart");
		if (c == null) {
			session.setAttribute("cart", cart);
		}
		OrderCart cart2 = (OrderCart) session.getAttribute("cart");
		Map<Integer, FoodItem> foodMap = cart2.getFoodMap();
		FoodList food = foodService.findById(foodId);

		cartService.addFood(food, foodMap);

		mav.setViewName("redirect:/menu");

		return mav;
	}

	@GetMapping(value = "/deleteOneFoodItem")
	public ModelAndView deleteOneCartItem(ModelAndView mav, @RequestParam(name = "foodId") Integer foodId,
			BindingResult rs, HttpSession session) {
		OrderCart cart = (OrderCart) session.getAttribute("cart");
		MealOrders newOrders = (MealOrders) session.getAttribute("orders");
		Map<Integer, FoodItem> Map = cart.getFoodMap();
		FoodList food = foodService.findById(foodId);
		cartService.deleteOneFoodItem(food, Map);
		mav.addObject("newOrders", newOrders);
		mav.setViewName("redirect:/goToCart");
		return mav;
	}
	
	
	@GetMapping(value = "/deleteOneFoodItemInCart")
	public ModelAndView deleteOneFoodItemInCart(ModelAndView mav, @RequestParam(name = "foodId") Integer foodId,
			BindingResult rs, HttpSession session) {
		OrderCart cart = (OrderCart) session.getAttribute("cart");
		MealOrders newOrders = (MealOrders) session.getAttribute("orders");
		Map<Integer, FoodItem> Map = cart.getFoodMap();
		FoodList food = foodService.findById(foodId);
		cartService.deleteOneFoodItem(food, Map);
		mav.addObject("newOrders", newOrders);
		mav.setViewName("redirect:/meals/menu");
		return mav;
	}
	
	
	

}
