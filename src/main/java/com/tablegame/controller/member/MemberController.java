package com.tablegame.controller.member;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.service.member.EmailSenderService;
import com.tablegame.service.member.MembersService;

@Controller
public class MemberController {
	
	@Autowired
	private MembersService service;
	
	@Autowired
	private EmailSenderService emailService;
	
	@Autowired
	private HttpServlet servlet;
	
	
	@PostMapping(value = "/addManager")
	public ModelAndView addManager(ModelAndView mav, 
			@ModelAttribute(name = "addManager") MembersBean member) {
		service.insertMember(member);
		
		mav.setViewName("redirect:/viewMembers/1");
		return mav;
	}
	
	@PostMapping(value = "/customerEditSelf")
	public ModelAndView editSelfCustomer(ModelAndView mav, 
			@ModelAttribute(name = "customer") MembersBean member, HttpSession session) {
		service.insertMember(member);
		session.setAttribute("member", member);
		mav.setViewName("redirect:/customerView");
		return mav;
	}
	
	@PostMapping(value = "/addCustomer")
	public ModelAndView addCustomer(ModelAndView mav, 
			@ModelAttribute(name = "addCustomer") MembersBean customer, 
			RedirectAttributes redirectAttributes) throws MessagingException {
		service.insertMember(customer);
		
		emailService.sendEmailImg(customer.getEmail(), servlet);
		
		redirectAttributes.addFlashAttribute("customer", customer);
		mav.setViewName("redirect:/insertSuccessView");
		return mav;
	}
	
	@GetMapping(value = "/insertSuccessView")
	public ModelAndView insertSuccessView(ModelAndView mav) {
		mav.setViewName("insertSuccessView");
		return mav;
	}
	
	
}
