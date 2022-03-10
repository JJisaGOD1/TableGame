package com.tablegame.controller.meals;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.meals.FoodList;
import com.tablegame.model.bean.meals.MealOrders;
import com.tablegame.model.bean.meals.MealOrdersRepository;
import com.tablegame.model.bean.meals.OrderCart;
import com.tablegame.service.meals.MealOrdersService;

@Controller
public class MealOrdersController {

	@Autowired
	private MealOrdersRepository dao;

	@Autowired
	private MealOrdersService service;

	@PostMapping(value = "/meals/addOrders") // @Valid 參考網址:http://www.mydlq.club/article/49/
	public ModelAndView postNewOrder(ModelAndView mav, @Valid @ModelAttribute(name = "orders") MealOrders orders,
			BindingResult rs, HttpSession session) {
		

//		session.setAttribute("orders",OOO);

//		newOrders.getOrderId();

//		Integer orderId = newOrders.getOrderId();
		session.removeAttribute("cart");
		
		if (!rs.hasErrors()) {
			service.insert(orders);
			System.out.println(orders.getOrderId());
			session.setAttribute("orders", orders);


			MealOrders newOrders = (MealOrders) session.getAttribute("orders");


			MealOrders order = service.findById(newOrders.getOrderId());

			newOrders.setPeopleNum(orders.getPeopleNum());
			newOrders.setTableNum(orders.getTableNum());
			newOrders.setOrderId(orders.getOrderId());
			newOrders.setTotalprice(0.0);
			newOrders.setProcessState("未處理");
			newOrders.setPaymentState("未付款");
			newOrders.setOrderDate(orders.getOrderDate());
			
			System.out.println(newOrders);
			mav.getModel().put("newOrders", newOrders);
			
		}

		mav.setViewName("redirect:/meals/menu");

		return mav;
	}

	@GetMapping("/deleteOrder")
	public ModelAndView deleteOrder(ModelAndView mav, @RequestParam("orderId") Integer orderId) {
		service.delete(orderId);

		mav.setViewName("redirect:/orderList");

		return mav;

	}

	@PostMapping("/editOrder")
	public ModelAndView editOrder(ModelAndView mav, @Valid @ModelAttribute(name = "order") MealOrders order,
			BindingResult result) {

		mav.setViewName("messages/editOrder");

		if (!result.hasErrors()) {
			// https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.entity-persistence.saving-entites
			service.insert(order);
			mav.setViewName("redirect:/orderList");
		}

		return mav;

	}

}
