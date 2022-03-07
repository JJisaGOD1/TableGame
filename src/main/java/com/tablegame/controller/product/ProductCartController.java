package com.tablegame.controller.product;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.dto.Cart;
import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.product.CartItem;
import com.tablegame.model.bean.product.OrderList;
import com.tablegame.model.bean.product.Orders;
import com.tablegame.model.bean.product.Product;
import com.tablegame.model.bean.product.ProductImformation;
import com.tablegame.service.product.CartService;
import com.tablegame.service.product.MemberService;
import com.tablegame.service.product.OrderListService;
import com.tablegame.service.product.OrdersService;
import com.tablegame.service.product.PIService;
import com.tablegame.service.product.ProductService;

@Controller
public class ProductCartController {

	@Autowired
	private CartService serviceC;

	@Autowired
	private ProductService serviceP;

	@Autowired
	private PIService servicePI;

	@Autowired
	private MemberService serviceM;

	@Autowired
	private OrdersService serviceOs;

	@Autowired
	private OrderListService serviceOL;

	@GetMapping("/showImformation")
	public ModelAndView showImformation(ModelAndView mav, @RequestParam(name = "id") Integer id) {

		Product p = serviceP.findById(id);
		mav.addObject("P", p);

		mav.setViewName("messages/showImformation");
		return mav;

	}

	@RequestMapping(value = "/addToCart")
	public ModelAndView addToCart(ModelAndView mav, @RequestParam(name = "id") Integer id,
			@RequestParam(value = "quantity") Integer quantity, BindingResult rs, HttpSession session, Cart cart) {
		Cart c = (Cart) session.getAttribute("cart");
		if (c == null) {
			session.setAttribute("cart", cart);
		}
		Cart cxcart = (Cart) session.getAttribute("cart");
		Map<Integer, CartItem> Map = cxcart.getProductMap();
		Product product = serviceP.findById(id);

		serviceC.addProduct(product, Map, quantity);

		mav.setViewName("redirect:/list");

		return mav;
	}

	@GetMapping(value = "/deleteCartItem")
	public ModelAndView deleteCartItem(ModelAndView mav, @RequestParam(name = "id") Integer id, BindingResult rs,
			HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		Map<Integer, CartItem> Map = cart.getProductMap();
		Product product = serviceP.findById(id);
		serviceC.deleteProduct(product, Map);
		mav.setViewName("redirect:/goToCart");
		return mav;
	}

	@GetMapping(value = "/deleteOneCartItem")
	public ModelAndView deleteOneCartItem(ModelAndView mav, @RequestParam(name = "id") Integer id, BindingResult rs,
			HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		Map<Integer, CartItem> Map = cart.getProductMap();
		Product product = serviceP.findById(id);
		serviceC.deleteOneProduct(product, Map);
		mav.setViewName("redirect:/goToCart");
		return mav;
	}

	@GetMapping(value = "/goToCart")
	public ModelAndView cartImformation(ModelAndView mav, HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		mav.addObject("C", cart);
		mav.setViewName("messages/Cart");
		return mav;
	}

	@GetMapping(value = "/Pay")
	public ModelAndView Pay(ModelAndView mav, HttpSession session) {
		boolean flag = false;
		Map<Integer, Product> a = new LinkedHashMap<Integer, Product>();

		Cart cart = (Cart) session.getAttribute("cart");
		MembersBean membersession = (MembersBean) session.getAttribute("member");

		if (cart == null) {
			mav.setViewName("redirect:/");
			return mav;
		}

		if (cart.getProductMap() == null) {
			mav.setViewName("redirect:/");
			return mav;
		}

		Map<Integer, CartItem> productMap = cart.getProductMap();

		System.out.println("productMap:" + productMap.size());

		for (Entry<Integer, CartItem> entry : productMap.entrySet()) {
			CartItem item = entry.getValue();
			Integer stock = item.getProduct().getStock();
			Integer quantity = item.getQuantity();
			if (stock < quantity) {
				flag = true;
				a.put(item.getProduct().getProduct_id(), item.getProduct());
			}
		}

		if (flag == true) {
			mav.addObject("P", a);
			mav.setViewName("messages/errorStockPay");
			return mav;
		}

		for (Entry<Integer, CartItem> entry : productMap.entrySet()) {
			CartItem item = entry.getValue();
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

		Orders orders = serviceOs.createBean("未處理", serviceM.findByName(membersession.getCusName()), date,
				cart.getPrice());
		serviceOs.insert(orders);

		for (Entry<Integer, CartItem> entry : productMap.entrySet()) {
			CartItem item = entry.getValue();
			OrderList orderlist = serviceOL.createbean(item.getQuantity(), item.getPrice(), orders, item.getProduct());
			serviceOL.insert(orderlist);
		}
		session.removeAttribute("cart");
		mav.setViewName("redirect:/");
		return mav;
	}

}
