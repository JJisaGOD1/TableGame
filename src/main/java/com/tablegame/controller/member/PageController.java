package com.tablegame.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.member.RatingsBean;
import com.tablegame.service.member.MembersService;

@Controller
public class PageController {
	
	@Autowired
	private MembersService service;
	

	
	@GetMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping(value = "/login")
	public ModelAndView checkLogin(ModelAndView mav, 
			@RequestParam(name = "email") String email,
			@RequestParam(name = "pwd") String pwd, HttpServletRequest request) {
		  HttpSession session = request.getSession();
		  boolean option = service.checkLogin(email, pwd);
		  if(option) {
			  Integer level = service.checkLevel(email);
			  MembersBean memberBean = service.findByEmail(email);
			  session.setAttribute("member", memberBean);
			  switch(level) {
			  	case 1:
				  mav.setViewName("membersPage/managerPage");
				  break;
			  	case 2:
				  mav.setViewName("membersPage/employeePage");
				  break;
				default:mav.setViewName("membersPage/customerPage");
			  }
			  return mav;
		  }
		  else {
			  mav.setViewName("redirect:/");
			  return mav;
		  }
	}
	
	@GetMapping(value = "/addManager")
	public ModelAndView managerAdd(ModelAndView mav) {
		MembersBean addManager =  new MembersBean();
		
		mav.getModel().put("addManager", addManager);
		mav.setViewName("membersPage/managerAddPage");
		return mav;
	}
	@GetMapping(value = "/viewMembers/{pageNumber}")
	public ModelAndView viewMembers(ModelAndView mav, 
			@PathVariable Integer pageNumber) {
		Page<MembersBean> members = service.findMembers(pageNumber);
		mav.getModel().put("members", members);
		mav.setViewName("membersPage/managerViewMember");
		return mav;
	}
	@GetMapping(value = "/viewCustomer/{pageNumber}")
	public ModelAndView viewCustomers(ModelAndView mav, 
			@PathVariable Integer pageNumber) {
		Page<MembersBean> customers = service.findCustomers(pageNumber);
		mav.getModel().put("customers", customers);
		mav.setViewName("membersPage/managerViewCustomer");
		return mav;
	}
	
	@GetMapping(value = "/customerEditSelf")
	public ModelAndView editSelfCustomer(ModelAndView mav, HttpSession session) {
		MembersBean logCustomer = (MembersBean)session.getAttribute("member");
		Integer loginCustomerId = logCustomer.getId();
		
		MembersBean nowCostomer = service.findMemberById(loginCustomerId);
		
		mav.getModel().put("customer", nowCostomer);
		mav.setViewName("membersPage/customerEditSelf");
		return mav;
	}
	
	@GetMapping(value = "/customerView")
	public ModelAndView customerView(ModelAndView mav, HttpSession session) {
		MembersBean logCustomer = (MembersBean)session.getAttribute("member");
		Integer loginCustomerId = logCustomer.getId();
		
		MembersBean nowCostomer = service.findMemberById(loginCustomerId); //重資料庫撈新資料
		
//		System.out.println(logCustomer.getCusName()); ////更正後Session為舊資料
		mav.getModel().put("customer", nowCostomer);
		mav.setViewName("membersPage/customerViewPage");
		return mav;
	}
	@GetMapping(value = "/addCustomer")
	public ModelAndView addCustomer(ModelAndView mav) {
		MembersBean customer = new MembersBean();
		mav.getModel().put("addCustomer", customer);
		
		mav.setViewName("addCustomer");
		return mav;
	}
	
	
	@ModelAttribute(name = "ratingMap")
	public Map<Integer, String> getRatingMap() {
		Map<Integer, String> ratingMap = new HashMap<>();
		List<RatingsBean> ratingList = service.findAllRatings();
		for(int i=0; i<2; i++) {
			Integer key = ratingList.get(i).getId();
			String value = ratingList.get(i).getRateName();
			ratingMap.put(key, value);
		}
		return ratingMap;
	}

}
