package com.tablegame.controller.meals;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
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

import com.tablegame.model.bean.meals.FoodList;
import com.tablegame.model.bean.meals.MealList;
import com.tablegame.model.bean.meals.MealOrders;
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

		mav.setViewName("messages/addFood");

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
		mav.setViewName("messages/foodList");
		Page<FoodList> page = foodService.findByPage(pageNumber);
//		List<FoodList> text = page.getContent();
		mav.getModel().put("page", page);
//		mav.addObject("page", page);
		return mav;
	}

	@GetMapping("/editFood")
	public ModelAndView editFood(ModelAndView mav, @RequestParam(name = "foodId") Integer foodId) {
		FoodList food = foodService.findById(foodId);

		mav.getModel().put("food", food);

		mav.setViewName("messages/editFood");

		return mav;
	}

	@GetMapping("/")
	public ModelAndView addOrdersPage(HttpSession session, ModelAndView mav) {
//		Orders orders = (Orders) session.getAttribute("orders");
//		session.setAttribute("orders", orders);
//		mav.getModel().put("orders", orders);
		
//		if(orders == null) {

		MealOrders newOrder = new MealOrders();
			session.setAttribute("orders", newOrder);
			mav.getModel().put("orders", newOrder);
//		}
		
		mav.setViewName("addOrders");

		return mav;
	}

	@ResponseBody
	@GetMapping("/menu")
	public ModelAndView viewMenuPage(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, HttpSession session, @Valid @ModelAttribute(name = "orders") MealOrders orders) {
		
		//從Session取得桌號與訂單id
//		Orders orderId = (Orders) session.getAttribute("orderId");
//		Orders tableNum = (Orders) session.getAttribute("tableNum");
		MealOrders newOrders = (MealOrders) session.getAttribute("orders");

		mav.setViewName("messages/menu");
		Page<FoodList> page = foodService.findByPageMenu(pageNumber);
//		List<FoodList> text = page.getContent();
//		mav.getModel().put("orderId", orderId);
//		mav.getModel().put("tableNum", tableNum);
		mav.getModel().put("page", page);
//		mav.addObject("page", page);
		mav.getModel().put("newOrders", newOrders);
		return mav;
	}

	// 因為uploadPage.jsp 在WEB-INF下，不能直接從瀏覽器訪問，所以要在這裡加一個uploadPage跳轉，這樣就可以通過
	@RequestMapping("/uploadPage")
	public String uploadPage() {
		return "messages/uploadPage"; // 過度跳轉頁
	}
	
	
	@GetMapping("/editPic")
	public ModelAndView editPic(ModelAndView mav, @RequestParam(name = "foodId") Integer foodId) {
		FoodList food = foodService.findById(foodId);

		mav.getModel().put("food", food);

		mav.setViewName("messages/editPic");

		return mav;
	}
	
	
	@PostMapping("/editPic") // 等價於 @RequestMapping(value = "/upload",method = RequestMethod.POST)
	public String uplaod(HttpServletRequest req, ModelAndView mav, @Valid @ModelAttribute("food") FoodList food, Model m) {// 1. 接受上傳的檔案
																						// @RequestParam("file")
					System.out.println(food.getFile().getOriginalFilename());																					// MultipartFile
																										// file
		try {
			// 2.根據時間戳建立新的檔名，這樣即便是第二次上傳相同名稱的檔案，也不會把第一次的檔案覆蓋了
			String fileName = System.currentTimeMillis() + food.getFile().getOriginalFilename();
			// 3.通過req.getServletContext().getRealPath("") 獲取當前專案的真實路徑，然後拼接前面的檔名
			String destFileName = req.getServletContext().getRealPath("") + "uploaded" + File.separator + fileName;
			// 4.第一次執行的時候，這個檔案所在的目錄往往是不存在的，這裡需要建立一下目錄（建立到了webapp下uploaded資料夾下）
			File destFile = new File(destFileName);
			destFile.getParentFile().mkdirs();
			// 5.把瀏覽器上傳的檔案複製到希望的位置
			food.getFile().transferTo(destFile);
			// 6.把檔名放在model裡，以便後續顯示用
			m.addAttribute("fileName", fileName);
			
			
			
			food.setFoodImage(fileName);
			foodService.insert(food);
			
			
		} catch (FileNotFoundException e) {	
			e.printStackTrace();
			return "上傳失敗," + e.getMessage();
		} catch (IOException e) {
			e.printStackTrace();
			return "上傳失敗," + e.getMessage();
		}
		return "redirect:/foodList";
	}
	
	
//	==============================================================================================

	@ResponseBody
	@GetMapping("/orderList")
	public ModelAndView viewOrderListPage(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		mav.setViewName("messages/orderList");
		Page<MealOrders> orderPage = ordersService.findByPage(pageNumber);
//				List<FoodList> text = page.getContent();
		mav.getModel().put("orderPage", orderPage);
//				mav.addObject("page", page);
		return mav;
	}
	
	@GetMapping("/editOrder")
	public ModelAndView editOrder(ModelAndView mav, @RequestParam(name = "orderId") Integer orderId) {
		MealOrders order = ordersService.findById(orderId);

		mav.getModel().put("order", order);

		mav.setViewName("messages/editOrder");

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

	//轉頁至加入食物數量頁面
//	@GetMapping("/addFoodItemPage")
//	public ModelAndView addFoodItemPage(ModelAndView mav, @RequestParam(name = "foodId") Integer foodId) {
//		FoodList foodList = new FoodList();
//		
//		MealList mealList = new MealList();
//		
//		Orders order = new Orders();
//		
//		//先從foodService抓到品項的，再從mealList的bean中設定進去
//		mealList.setFoodList(foodService.findById(foodId));
// 
//		mealService.
//		mav.getModel().put("mealList", mealList);
//
//		mav.setViewName("messages/editFood");
//
//		return mav;
//	}

	

}
