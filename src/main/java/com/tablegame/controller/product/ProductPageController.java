package com.tablegame.controller.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.product.ProductOrders;
import com.tablegame.model.bean.product.Product;
import com.tablegame.service.product.ProductOrdersService;
import com.tablegame.service.product.ProductService;

@Controller
public class ProductPageController {

	@Autowired
	private ProductService serviceP;

	@Autowired
	private ProductOrdersService serviceOs;



	@GetMapping("/about")
	public String aboutPage() {
		return "product/about";
	}

	@GetMapping("/viewProducts")
	public ModelAndView viewMessagePage1(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		mav.setViewName("product/viewProducts");

		Page<Product> P = serviceP.findByPage(pageNumber);

//		mav.getModel().put("page", page);

		mav.addObject("P", P);

		return mav;
//		return null;
	}

	@GetMapping("/addProduct")
	public ModelAndView addProductPage(ModelAndView mav) {

		mav.setViewName("product/addProduct");

		Product product = new Product();

		mav.getModel().put("P", product);

		return mav;
	}

	@GetMapping("/list")
	public ModelAndView viewlistPage1(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		mav.setViewName("product/list");

		Page<Product> P = serviceP.findByPage(pageNumber);

//		mav.getModel().put("page", page);

		mav.addObject("P", P);

		return mav;
//		return null;
	}

	@GetMapping("/myorders")
	public ModelAndView myorderspage(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			HttpSession session) {
		Integer userid = (Integer) session.getAttribute("userid");
		Page<ProductOrders> P = serviceOs.findmyorderPage(userid, pageNumber);
		mav.addObject("P", P);
		mav.setViewName("product/myorders");
		return mav;
//		return null;
	}



	@GetMapping("/viewProductsnologin")
	public ModelAndView viewProductsnologin(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		mav.setViewName("product/viewProductsnologin");

		Page<Product> P = serviceP.findByPage(pageNumber);

//		mav.getModel().put("page", page);

		mav.addObject("P", P);

		return mav;
//		return null;
	}

	@GetMapping("/showImformationnologin")
	public ModelAndView showImformationnologin(ModelAndView mav, @RequestParam(name = "id") Integer id) {

		Product p = serviceP.findById(id);
		mav.addObject("P", p);

		mav.setViewName("product/showImformationnologin");
		return mav;

	}

	@RequestMapping(value = "/searchProduct")
	public ModelAndView searchProduct(ModelAndView mav, @RequestParam(name = "search") String search,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Pageable pageable) {
		System.out.println("搜尋商品:" + search);
		List<Product> a = serviceP.findsearchPage(search);
		Page<Product> P = serviceP.listConvertToPage(a, pageable);
		mav.setViewName("product/list");
		mav.addObject("P", P);
		return mav;
	}
}