package com.tablegame.controller.product;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.product.ProductOrders;
import com.tablegame.service.product.ProductOrdersService;

@Controller
public class ProductOrderController {

	@Autowired
	private ProductOrdersService serviceOs;

	@GetMapping("/products/checkOrders")
	public ModelAndView showAllOrders(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		Page<ProductOrders> P = serviceOs.findByPage(pageNumber);

		mav.addObject("P", P);

		mav.setViewName("product/checkOrders");
		return mav;
	}

	@GetMapping("/products/checkPackage")
	public ModelAndView checkPackage(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		ProductOrders orders = serviceOs.findById(id);

		if (orders.getProcessingstatus().equals("未處理")) {
			orders.setProcessingstatus("處理中");
		}
		mav.addObject("orders", orders);
		mav.setViewName("product/checkOrderList");
		serviceOs.insert(orders);
		return mav;
	}

	@GetMapping("/products/sendPackage")
	public ModelAndView sendPackage(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		ProductOrders orders = serviceOs.findById(id);

		orders.setProcessingstatus("已送貨");
		mav.addObject("orders", orders);
		mav.setViewName("redirect:/products/checkOrders");
		serviceOs.insert(orders);
		return mav;
	}

	@GetMapping("/products/coustomercheckPackage")
	public ModelAndView coustomercheckPackage(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		ProductOrders orders = serviceOs.findById(id);

		mav.addObject("orders", orders);
		mav.setViewName("product/checkOrderList");
		return mav;
	}

}
