package com.tablegame.controller.product;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.dto.ProductCart;
import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.product.ProductCartItem;
import com.tablegame.model.bean.product.ProductOrderList;
import com.tablegame.model.bean.product.ProductOrders;
import com.tablegame.model.bean.product.Product;
import com.tablegame.model.bean.product.ProductImformation;
import com.tablegame.service.product.ProductCartService;
import com.tablegame.service.product.ProductOrderListService;
import com.tablegame.service.product.ProductOrdersService;
import com.tablegame.service.product.PIService;
import com.tablegame.service.product.ProductService;

@Controller
public class ProductCartController {

	@Autowired
	private ProductCartService serviceC;

	@Autowired
	private ProductService serviceP;

	@Autowired
	private PIService servicePI;

	@Autowired
	private ProductOrdersService serviceOs;

	@Autowired
	private ProductOrderListService serviceOL;

	@GetMapping("/products/showImformation")
	public ModelAndView showImformation(ModelAndView mav, @RequestParam(name = "id") Integer id) {

		Product p = serviceP.findById(id);
		mav.addObject("P", p);

		mav.setViewName("product/showImformation");
		return mav;

	}

	@RequestMapping(value = "/products/addToProductCart")
	public ModelAndView addToProductCart(ModelAndView mav, @RequestParam(name = "id") Integer id,
			@RequestParam(value = "quantity") Integer quantity, BindingResult rs, HttpSession session,
			ProductCart cart) {
		ProductCart c = (ProductCart) session.getAttribute("productcart");
		if (c == null) {
			session.setAttribute("productcart", cart);
		}
		ProductCart cxcart = (ProductCart) session.getAttribute("productcart");
		Map<Integer, ProductCartItem> Map = cxcart.getProductMap();
		Product product = serviceP.findById(id);

		serviceC.addProduct(product, Map, quantity);

		mav.setViewName("redirect:/products/list");

		return mav;
	}

	@GetMapping(value = "/products/deleteCartItem")
	public ModelAndView deleteCartItem(ModelAndView mav, @RequestParam(name = "id") Integer id, BindingResult rs,
			HttpSession session) {
		ProductCart cart = (ProductCart) session.getAttribute("productcart");
		Map<Integer, ProductCartItem> Map = cart.getProductMap();
		Product product = serviceP.findById(id);
		serviceC.deleteProduct(product, Map);
		mav.setViewName("redirect:/products/goToProductCart");
		return mav;
	}

	@GetMapping(value = "/products/deleteOneCartItem")
	public ModelAndView deleteOneCartItem(ModelAndView mav, @RequestParam(name = "id") Integer id, BindingResult rs,
			HttpSession session) {
		ProductCart cart = (ProductCart) session.getAttribute("productcart");
		Map<Integer, ProductCartItem> Map = cart.getProductMap();
		Product product = serviceP.findById(id);
		serviceC.deleteOneProduct(product, Map);
		mav.setViewName("redirect:/products/goToProductCart");
		return mav;
	}

	@GetMapping(value = "/products/deleteOneLListItem")
	public ModelAndView deleteOneLListItem(ModelAndView mav, @RequestParam(name = "id") Integer id, BindingResult rs,
			HttpSession session) {
		ProductCart cart = (ProductCart) session.getAttribute("productcart");
		Map<Integer, ProductCartItem> Map = cart.getProductMap();
		Product product = serviceP.findById(id);
		serviceC.deleteOneProduct(product, Map);
		mav.setViewName("redirect:/products/list");
		return mav;
	}

	@GetMapping(value = "/products/goToProductCart")
	public ModelAndView cartImformation(ModelAndView mav, HttpSession session) {
		ProductCart cart = (ProductCart) session.getAttribute("productcart");
		mav.addObject("C", cart);
		mav.setViewName("product/ProductCart");
		return mav;
	}

	@GetMapping(value = "/products/Pay")
	public ModelAndView Pay(ModelAndView mav, HttpSession session) {
		boolean flag = false;
		Map<Integer, Product> a = new LinkedHashMap<Integer, Product>();

		ProductCart cart = (ProductCart) session.getAttribute("productcart");
		MembersBean membersession = (MembersBean) session.getAttribute("member");

		if (cart == null) {
			mav.setViewName("redirect:/products/list");
			return mav;
		}

		if (cart.getProductMap() == null) {
			mav.setViewName("redirect:/products/list");
			return mav;
		}

		Map<Integer, ProductCartItem> productMap = cart.getProductMap();

		System.out.println("productMap:" + productMap.size());

		for (Entry<Integer, ProductCartItem> entry : productMap.entrySet()) {
			ProductCartItem item = entry.getValue();
			Integer stock = item.getProduct().getStock();
			Integer quantity = item.getQuantity();
			if (stock < quantity) {
				flag = true;
				a.put(item.getProduct().getProduct_id(), item.getProduct());
			}
		}

		if (flag == true) {
			mav.addObject("P", a);
			mav.setViewName("product/errorStockPay");
			return mav;
		}

		for (Entry<Integer, ProductCartItem> entry : productMap.entrySet()) {
			ProductCartItem item = entry.getValue();
			Product product = item.getProduct();
			Integer stock = product.getStock();
			Integer quantity = item.getQuantity();
			Integer result = stock - quantity;
			product.setStock(result);
			if (result <= 10) {
				product.setSellstatus("下架中");
			}
			serviceP.insert(product);

			Date d = new Date();
			ProductImformation insert = new ProductImformation();
			insert.setProductid_id(product.getProduct_id());
			insert.setStock(result);
			insert.setChangedate(d);
			insert.setHistory("賣出" + quantity * -1);
			servicePI.insert(insert);
		}

		Date date = new Date();

		ProductOrders orders = serviceOs.createBean("未處理", membersession, date, cart.getPrice());
		serviceOs.insert(orders);

		for (Entry<Integer, ProductCartItem> entry : productMap.entrySet()) {
			ProductCartItem item = entry.getValue();
			ProductOrderList orderlist = serviceOL.createbean(item.getQuantity(), item.getPrice(), orders,
					item.getProduct());
			serviceOL.insert(orderlist);
		}
		session.removeAttribute("productcart");
		mav.setViewName("redirect:/products/myorders");
		return mav;
	}

	@ResponseBody
	@GetMapping(value = "/products/addonetocart")
	public ProductCart addonetocart(ModelAndView mav, @RequestParam(name = "id") Integer id, HttpSession session,
			ProductCart cart) {
		ProductCart c = (ProductCart) session.getAttribute("productcart");
		if (c == null) {
			session.setAttribute("productcart", cart);
		}
		ProductCart cxcart = (ProductCart) session.getAttribute("productcart");
		Map<Integer, ProductCartItem> Map = cxcart.getProductMap();
		Product product = serviceP.findById(id);
		serviceC.addProduct(product, Map, 1);

		ProductCart CC = (ProductCart) session.getAttribute("productcart");

		return CC;
	}

	@ResponseBody
	@GetMapping(value = "/products/enterlist")
	public ProductCart enterlist(HttpSession session, ProductCart cart) {
		ProductCart c = (ProductCart) session.getAttribute("productcart");
		if (c == null) {
			session.setAttribute("productcart", cart);
		}
		ProductCart CC = (ProductCart) session.getAttribute("productcart");

		return CC;
	}

	@ResponseBody
	@GetMapping(value = "/products/deleteOneItemAJAX")
	public ProductCart deleteOneItemAJAX(@RequestParam(name = "id") Integer id, HttpSession session) {
		ProductCart cart = (ProductCart) session.getAttribute("productcart");
		Map<Integer, ProductCartItem> Map = cart.getProductMap();
		Product product = serviceP.findById(id);
		serviceC.deleteOneProduct(product, Map);
		ProductCart CC = (ProductCart) session.getAttribute("productcart");
		return CC;
	}
}
