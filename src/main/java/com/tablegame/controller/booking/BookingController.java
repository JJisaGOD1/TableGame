package com.tablegame.controller.booking;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.booking.Booking;
import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.service.booking.BookingService;






@Controller
public class BookingController {
	@Autowired
	private BookingService service;
	
	
	@GetMapping("/")
	public String home() {
		return "index";
	}
	
	@GetMapping("/addBooking")
	public String addBooking() {
		
		return "booking/addBooking";
	}
	

	
	@GetMapping("/about")
	public String about() {
		return "booking/about";
	}
	

//	@GetMapping("/getAll")
//	public ModelAndView getAll(ModelAndView mav) {
//
//		mav.setViewName("messages/getAll");
//
//		return mav;
//	}
	
	@GetMapping("/addNew")
	public ModelAndView addNew(ModelAndView mav) {
//		WorkMessages msg = service.findById(name);
		
//		mav.getModel().put("workMessage", msg);
		
		mav.setViewName("booking/addNew");
		
		return mav;
		
	}
	//新增
	 @PostMapping("/users")
	    public ModelAndView add(ModelAndView mav,@Valid 
	    		@ModelAttribute(name = "booking") Booking msg) {
	       
			 service.insert(msg);
			 mav.getModel().put("booking", msg);
			 mav.setViewName("booking/success2");
			
			return mav;
	    }
	 
	 //查全部

	 
	 @GetMapping("/getAll")
		public ModelAndView viewMessagePage(ModelAndView mav, @RequestParam(name="p",defaultValue = "1") Integer pageNumber) {
			mav.setViewName("booking/getAll");
			
			Page<Booking> page =service.findByPage(pageNumber);
			
			mav.getModel().put("page",page);
			return mav;
		}
	 
	 
	 //查自己訂位
	 @GetMapping("/lnquire")
	 public ModelAndView findLoginid(ModelAndView mav,HttpSession hs) {
		 MembersBean log =(MembersBean) hs.getAttribute("login");
		Integer logid = log.getId();
		
		List<Booking> msg =  service.findByLoginId(logid);
		
		mav.getModel().put("lnquire", msg);
		
		
		mav.setViewName("booking/lnquire");
		 
		 
		 return mav; 
	 }
	 
	 //修改訂位-找到單筆資料
	 @GetMapping("/editbooking")
		public ModelAndView editMessage(ModelAndView mav, @RequestParam(name = "id") Integer id) {
			Booking msg = service.findById(id);
			
			mav.getModel().put("booking", msg);
			
			mav.setViewName("booking/editbooking");
			
			return mav;
			
		}
	 
	 //修改訂位
		@PostMapping("/editbooking")
		public ModelAndView editMessage(ModelAndView mav,@Valid@ModelAttribute(name="booking")Booking msg,BindingResult result) {
			
			mav.setViewName("booking/editbooking");
			
			if(!result.hasErrors()) {
				service.insert(msg);
				mav.setViewName("redirect:/getAll");	
				
			}
			return mav;
		}
		
		 @GetMapping("/lnquires")
			public ModelAndView lnquires(ModelAndView mav, @RequestParam(name = "id") Integer id) {
				Booking msg = service.findById(id);
				
				mav.getModel().put("booking", msg);
				
				mav.setViewName("booking/memberedit");
				
				return mav;
				
			}
		
		 //會員修改訂位
		@PostMapping("/lnquires")
		public ModelAndView lnquires1(ModelAndView mav,@Valid@ModelAttribute(name="booking")Booking msg,BindingResult result) {
			
			mav.setViewName("booking/memberedit");
			
			if(!result.hasErrors()) {
				service.insert(msg);
				mav.setViewName("redirect:/lnquire");	
				
			}
			return mav;
		}
	 
		
	//刪除訂位	
	 @GetMapping("deletbooking")
	    public ModelAndView deletbooking(ModelAndView mav,@RequestParam("id") Integer id) {
			
			service.delete(id);
			
			mav.setViewName("redirect:/getAll");
			
			return mav;
		}
	 
	 }

