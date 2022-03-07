package com.tablegame.controller.meals;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.meals.FoodList;
import com.tablegame.model.bean.meals.FoodListRepository;
import com.tablegame.service.meals.FoodListService;

@Controller
public class FoodListController {
	
	@Autowired
	private FoodListRepository dao;
	
	@Autowired
	private FoodListService service;
	
	@PostMapping(value="/addFood")                  //@Valid 參考網址:http://www.mydlq.club/article/49/
	public ModelAndView postNewMessage(ModelAndView mav,@Valid @ModelAttribute(name = "newFood") FoodList food, BindingResult rs) {
		
		if(!rs.hasErrors()) {
			service.insert(food);
			FoodList newFood = new FoodList();
			mav.getModel().put("newFood", newFood);
		}
		
//		Page<FoodList> page = service.findByPage(pageNumber);
//		mav.getModel().put("page", page);
		mav.setViewName("redirect:/foodList");

		return mav;
	}
	
	@GetMapping("/deleteFood")
	public ModelAndView deleteFood(ModelAndView mav, @RequestParam("foodId") Integer foodId) {
		service.delete(foodId);
		
		mav.setViewName("redirect:/foodList");
		
		return mav;
		
	}
	
	
	
	
//	@RestController
//	@RequestMapping("/images")
//	public class ImageController {
//	    @Resource
//	    private ImageResourceHttpRequestHandler imageResourceHttpRequestHandler;
//	    @GetMapping("/download")
//	    public void download(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
//	            throws ServletException, IOException {
//	        File file = new File("/path/to/image.jpg");
//	        httpServletRequest.setAttribute(ImageResourceHttpRequestHandler.ATTRIBUTE_FILE, file);
//	        imageResourceHttpRequestHandler.handleRequest(httpServletRequest, httpServletResponse);
//	    }
//	}
	
	
	
	@PostMapping("/editFood")
	public ModelAndView editFood(ModelAndView mav, @Valid @ModelAttribute(name="food") FoodList food, BindingResult result) {
		
		mav.setViewName("messages/editMessage");
		
		if(!result.hasErrors()) {
			// https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.entity-persistence.saving-entites
			 service.insert(food);
			 mav.setViewName("redirect:/foodList");
		}
		
		return mav;
		
	}
	
	
	

	
	

}
