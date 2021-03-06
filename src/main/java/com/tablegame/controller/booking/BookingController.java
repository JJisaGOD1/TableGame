package com.tablegame.controller.booking;


import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tablegame.dto.BookingDto;
import com.tablegame.dto.ProductIdDto;
import com.tablegame.model.bean.booking.Booking;
import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.product.Product;
import com.tablegame.service.booking.BookingService;
import com.tablegame.service.booking.EmailService;






@Controller
public class BookingController {
	@Autowired
	private BookingService service;
	@Autowired
	private EmailService serviceE;
	
	@Autowired
	private HttpServlet servlet;
	
	@GetMapping("/addBooking")
	public String addBooking() {
		
		return "booking/addBooking";
	}
	

	@GetMapping("/addNew")
	public ModelAndView addNew(ModelAndView mav) {

		mav.setViewName("booking/addNew");
		
		return mav;
		
	}
	//新增
	 @PostMapping("/users")
	    public ModelAndView add(ModelAndView mav,@Valid 
	    		@ModelAttribute(name = "booking") Booking msg ,MembersBean customer,HttpSession session,RedirectAttributes redirect) throws MessagingException {

			 service.insert(msg);
			 //寄送文字訊息
//			 serviceE.sendEmailText(msg.getUser().getEmail(),msg);
			 
			 //寄送圖片訊息
			 serviceE.sendEmailImg(msg.getUser().getEmail(),msg,servlet);
			 
			 //直接輸入email
//			 serviceE.sendEmailText("chrayray@gmail.com");
			 mav.getModel().put("booking", msg);
			 mav.setViewName("booking/success2");
			
			return mav;
	    }
	 
	      //管理員新增
		 @PostMapping("/userss")
		    public ModelAndView adds(ModelAndView mav,@Valid 
		    		@ModelAttribute(name = "booking") Booking msg ,MembersBean customer,HttpSession session) throws MessagingException {

				 service.insert(msg);
				 //寄送文字訊息
//				 serviceE.sendEmailText(msg.getUser().getEmail(),msg);
				 
				 //寄送圖片訊息
				 serviceE.sendEmailImg(msg.getUser().getEmail(),msg,servlet);
				 
				 //直接輸入email
//				 serviceE.sendEmailText("chrayray@gmail.com");
				 mav.getModel().put("booking", msg);
				 
				 List<Booking> page =service.findAllbooking();
					
				mav.getModel().put("page",page);
				 mav.setViewName("booking/getAll");
				
				return mav;
		    }
		 
	 
	 
	 //查全部
	 @GetMapping("/getAll")
		public ModelAndView viewMessagePage(ModelAndView mav) {
			mav.setViewName("booking/getAll");
			
			List<Booking> page =service.findAllbooking();
			
			mav.getModel().put("page",page);
			return mav;
		}	
	 
	 
	 
	 //有分頁
//	 @GetMapping("/getAll")
//		public ModelAndView viewMessagePage(ModelAndView mav, @RequestParam(name="p",defaultValue = "1") Integer pageNumber) {
//			mav.setViewName("booking/getAll");
//			
//			Page<Booking> page =service.findByPage(pageNumber);
//			
//			mav.getModel().put("page",page);
//			return mav;
//		}
	 
	 
	 //查自己訂位
	 @GetMapping("/lnquire")
	 public ModelAndView findLoginid(ModelAndView mav,HttpSession hs) {
		 MembersBean log =(MembersBean) hs.getAttribute("member");
		Integer logid = log.getId();
		
		List<Booking> msg =  service.findByLoginId(logid);
		
		mav.getModel().put("lnquire", msg);
		
		
		mav.setViewName("booking/lnquire");
		 
		 
		 return mav; 
	 }
	 
	 //電話找ID
	 @ResponseBody
	 @GetMapping("/phone/{sp}")
	 public  MembersBean findByphone(@PathVariable(name="sp")String sp) {
	
//		 MembersBean phone=(MembersBean) hs.getAttribute("member");
		 
		 
//		 Integer phones=phone.getId();
		 
		 MembersBean msg = service.findByphone(sp);
		 
//		 mav.getModel().put("phone", msg);
//		 
//		 mav.setViewName("booking/getAll");
		 
		 return msg;
		 
		 
		 
	 }
	 
	 
	 
	 
	 
	 
	 //修改訂位-找到單筆資料
//	 @GetMapping("/editbooking")
//		public ModelAndView editMessage(ModelAndView mav, @RequestParam(name = "id") Integer id) {
//			Booking msg = service.findById(id);
//			
//			mav.getModel().put("booking", msg);
//			
//			mav.setViewName("booking/editbooking");
//			
//			return mav;
//			
//		}
	 
	 //修改訂位
		@PostMapping("/editbooking")
		public ModelAndView editMessage(ModelAndView mav,@Valid@ModelAttribute(name="booking")Booking msg,BindingResult result) {
			
		
			Date d=new Date();
			msg.setAdded(d);
			mav.setViewName("booking/editbooking");
				
			if(!result.hasErrors()) {
				service.insert(msg);
				mav.setViewName("redirect:/getAll");	
				
			}
			return mav;
		
		}
		
		
		//會員修改訂位
//		 @GetMapping("/lnquires")
//			public ModelAndView lnquires(ModelAndView mav, @RequestParam(name = "id") Integer id) {
//				Booking msg = service.findById(id);
//				
//				mav.getModel().put("booking", msg);
//				
//				mav.setViewName("booking/memberedit");
//				
//				return mav;
//				
//			}
		
		 
		@PostMapping("/member")
		public ModelAndView lnquires(ModelAndView mav,@Valid@ModelAttribute(name="booking")Booking msg,BindingResult result) {
			
			System.out.println(msg.toString());
			
			Date d=new Date();
			msg.setAdded(d);
//			mav.setViewName("booking/lnquire");
			
			if(!result.hasErrors()) {
				service.insert(msg);
				mav.setViewName("redirect:/lnquire");	
				
			}
			return mav;
		}
	 
		
	//刪除訂位	
//	 @GetMapping("deletbooking/{id}")
//	    public ModelAndView deletbooking(ModelAndView mav,@PathVariable("id") Integer id) {
//			
//			service.delete(id);
//			
//			mav.setViewName("redirect:/getAll");
//			
//			return mav;
//		}
		
		 @GetMapping("deletbooking/{orderid}")
		    public ModelAndView deletbooking(ModelAndView mav,@PathVariable int orderid) {
				System.out.println("ssaa");
				service.delete(orderid);
				
				
				mav.setViewName("redirect:/getAll");
				
				return mav;
			}
		
	 
	 @GetMapping("deletbookings/{orderid}")
	    public ModelAndView deletbookings(ModelAndView mav,@PathVariable int orderid) {
		 System.out.println("ssaa");
			service.delete(orderid);
			
			mav.setViewName("redirect:/lnquire");
			
			return mav;
		}
	 
	 @ResponseBody
	 @PostMapping("time")
		public List<Booking> getProd(@RequestBody BookingDto json) {
			System.out.println(json.getDate()+" "+json.getPeriod());
			List<Booking> time = service.findBytime(json.getDate(),json.getPeriod());
		 
			return time;
		}
	 
	 
	 }



