package com.tablegame.controller.meals;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.meals.FoodItemChart;
import com.tablegame.model.bean.meals.FoodList;
import com.tablegame.model.bean.meals.MealList;
import com.tablegame.model.bean.meals.MealOrders;
import com.tablegame.model.bean.product.Item;
import com.tablegame.model.bean.product.Product;
import com.tablegame.service.meals.FoodListService;
import com.tablegame.service.meals.MealListService;
import com.tablegame.service.meals.MealOrdersService;

@Controller
public class MealPageController {

	@Autowired
	private FoodListService foodService;

	@Autowired
	private MealOrdersService ordersService;

	@Autowired
	private MealListService mealService;

//	@GetMapping("/")
//	public String home() {
//		return "index";
//		return "addOrders";
//	}

//	@GetMapping("/orderList")
//	public String orderListPage() {
//		return "messages/orderList";
//	}

//	@ResponseBody
//	@GetMapping("/orderList")
//	public ModelAndView viewOrderListPage(ModelAndView mav, @RequestParam(name = "p",defaultValue = "1") Integer pageNumber) {
//			
//		mav.setViewName("messages/orderList");
//		Page<FoodList> orderPage = service.findByPage(pageNumber);
//		mav.getModel().put("orderPage", orderPage);
//		return mav;
//	}

//	==============================================================================================

	@GetMapping("/addFood")
	public ModelAndView addFood(ModelAndView mav) {

		mav.setViewName("meals/messages/addFood");

		FoodList newFood = new FoodList();

		mav.getModel().put("newFood", newFood);
		return mav;
	}

//	@GetMapping("/foodList")
//	public String foodListPage() {
//		return "messages/foodList";
//	}
	@ResponseBody
	@GetMapping("/foodList")
	public ModelAndView viewFoodListPage(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		mav.setViewName("meals/messages/foodList");
		Page<FoodList> page = foodService.findByPage(pageNumber);
//		List<FoodList> text = page.getContent();
		
		FoodList f = new FoodList();
		FoodList ff = new FoodList();
		
		mav.getModel().put("page", page);
		mav.addObject("Food", f);
		mav.addObject("newFood", ff);
		
		return mav;
	}

	@ResponseBody
	@PostMapping("/foodListAjax")
	public List<FoodList> findFoodList() {
		List<FoodList> foodList = foodService.findAllFood();
		return foodList;

	}

	@GetMapping("/editFood")
	public ModelAndView editFood(ModelAndView mav, @RequestParam(name = "foodId") Integer foodId) {
		FoodList food = foodService.findById(foodId);

		mav.getModel().put("food", food);

		mav.setViewName("meals/messages/editFood");

		return mav;
	}

	@GetMapping("/startOrder")
	public ModelAndView addOrdersPage(HttpSession session, ModelAndView mav) {
//		Orders orders = (Orders) session.getAttribute("orders");
//		session.setAttribute("orders", orders);
//		mav.getModel().put("orders", orders);

//		if(orders == null) {

		MealOrders newOrder = new MealOrders();
		session.setAttribute("orders", newOrder);
		mav.getModel().put("orders", newOrder);
//		}

		mav.setViewName("meals/addOrders");

		return mav;
	}

	@ResponseBody
	@GetMapping("/meals/menu")
	public ModelAndView viewMenuPage(ModelAndView mav, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber,
			HttpSession session, @Valid @ModelAttribute(name = "orders") MealOrders orders) {

		// ???Session?????????????????????id
//		Orders orderId = (Orders) session.getAttribute("orderId");
//		Orders tableNum = (Orders) session.getAttribute("tableNum");
		MealOrders newOrders = (MealOrders) session.getAttribute("orders");

		mav.setViewName("meals/messages/menu");
		Page<FoodList> page = foodService.findByPageMenu(pageNumber);
//		List<FoodList> text = page.getContent();
//		mav.getModel().put("orderId", orderId);
//		mav.getModel().put("tableNum", tableNum);
		mav.getModel().put("page", page);
//		mav.addObject("page", page);
		mav.getModel().put("newOrders", newOrders);
		return mav;
	}

	// ??????uploadPage.jsp ???WEB-INF??????????????????????????????????????????????????????????????????uploadPage??????????????????????????????
	@RequestMapping("/uploadPage")
	public String uploadPage() {
		return "meals/messages/uploadPage"; // ???????????????
	}

	@GetMapping("/meals/editPic")
	public ModelAndView editPic(ModelAndView mav, @RequestParam(name = "foodId") Integer foodId) {
		FoodList food = foodService.findById(foodId);

		mav.getModel().put("food", food);

		mav.setViewName("meals/messages/editPic");

		return mav;
	}

	@PostMapping("/meals/editPic") // ????????? @RequestMapping(value = "/upload",method = RequestMethod.POST)
	public String uplaod(HttpServletRequest req, ModelAndView mav, @Valid @ModelAttribute("food") FoodList food,
			Model m) {// 1. ?????????????????????
		// @RequestParam("file")
		System.out.println(food.getFile().getOriginalFilename()); // MultipartFile
		// file
		try {
			// 2.?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
			String fileName = System.currentTimeMillis() + food.getFile().getOriginalFilename();
			// 3.??????req.getServletContext().getRealPath("") ???????????????????????????????????????????????????????????????
			String destFileName = req.getServletContext().getRealPath("") + "uploaded" + File.separator + fileName;
			// 4.???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????webapp???uploaded???????????????
			File destFile = new File(destFileName);
			destFile.getParentFile().mkdirs();
			// 5.???????????????????????????????????????????????????
			food.getFile().transferTo(destFile);
			// 6.???????????????model???????????????????????????
			m.addAttribute("fileName", fileName);

			food.setFoodImage(fileName);
			foodService.insert(food);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return "????????????," + e.getMessage();
		} catch (IOException e) {
			e.printStackTrace();
			return "????????????," + e.getMessage();
		}
		return "redirect:/foodList";
	}

//	==============================================================================================

//	???DataTable???????????????
//	@ResponseBody
//	@GetMapping("/orderList")
//	public ModelAndView viewOrderListPage(ModelAndView mav,
//			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
//		mav.setViewName("meals/messages/orderList");
//		Page<MealOrders> orderPage = ordersService.findByPage(pageNumber);
//		mav.getModel().put("orderPage", orderPage);
//		return mav;
//	}
	
	@ResponseBody
	@GetMapping("/orderList")
	public ModelAndView viewOrderListWholePage(ModelAndView mav,@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		mav.setViewName("meals/messages/orderList");
		Page<MealOrders> orderPage = ordersService.findWholeByPage(pageNumber);
		mav.getModel().put("orderPage2", orderPage);
		return mav;
	}

	@GetMapping("/editOrder")
	public ModelAndView editOrder(ModelAndView mav, @RequestParam(name = "orderId") Integer orderId) {
		MealOrders order = ordersService.findById(orderId);

		mav.getModel().put("order", order);

		mav.setViewName("meals/messages/editOrder");

		return mav;
	}

//	==============================================================================================

	@ResponseBody
	@GetMapping("/finishedOrder")
	public ModelAndView viewFoodListPage(ModelAndView mav, HttpSession session) {

		MealOrders newOrders = (MealOrders) session.getAttribute("orders");

		mav.setViewName("messages/finishedOrder");
		List<MealList> mealList = mealService.findMealByOrderId(newOrders);
//		Page<FoodList> page = foodService.findByPage(pageNumber);
//		List<FoodList> text = page.getContent();
		mav.getModel().put("mealList", mealList);
//		mav.addObject("page", page);
		return mav;
	}

	// ?????????????????????????????????
//	@GetMapping("/addFoodItemPage")
//	public ModelAndView addFoodItemPage(ModelAndView mav, @RequestParam(name = "foodId") Integer foodId) {
//		FoodList foodList = new FoodList();
//		
//		MealList mealList = new MealList();
//		
//		Orders order = new Orders();
//		
//		//??????foodService????????????????????????mealList???bean???????????????
//		mealList.setFoodList(foodService.findById(foodId));
// 
//		mealService.
//		mav.getModel().put("mealList", mealList);
//
//		mav.setViewName("messages/editFood");
//
//		return mav;
//	}

	@GetMapping(value = "/meals/foodItemChart")
	public ModelAndView FoodItemChart(ModelAndView mav) {
		mav.setViewName("meals/messages/foodItemChart");
		return mav;
	}

//	@RequestMapping("getFoodItemChart")
//	@ResponseBody
//	public FoodItemChart getChart() {
//		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
//		List<String> names = new ArrayList<String>();
//		List<Date> samedate = ordersService.selectSamedate();
//		List<MealOrders> foodList = ordersService.selectFoodTypeCountbyFoodName();
//		for (Date f : samedate) {
//			String Date = f.toInstant().atOffset(ZoneOffset.UTC).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//			names.add(Date);
//		}
//
//		for (String name : names) {
//			HashMap<String, Object> vals = new HashMap<String, Object>();
//			vals.put("name", name);
//			vals.put("value", ordersService.findprice(name));
//			list.add(vals);
//		}
//
//		FoodItemChart foodItem = new FoodItemChart();
//		foodItem.setNumber(list);
//		foodItem.setTitle(names);
//		return foodItem;
//	}

}
