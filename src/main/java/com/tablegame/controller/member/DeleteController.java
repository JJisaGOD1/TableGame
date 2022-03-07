package com.tablegame.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.service.member.MembersService;

@Controller
@RequestMapping(value = "/admin")
public class DeleteController {
	
	@Autowired
	private  MembersService service;
	
	
	
	@GetMapping(value = "/deleteMember/{id}")
	public ModelAndView deleteManager (ModelAndView mav, @PathVariable Integer id ) {
		service.deleteMemberById(id);
		
		mav.setViewName("redirect:/viewMembers/1");
		return mav;
	}
	
	//@GetMapping(value = {"/deleteMember/{id}", "/deleteCustomer/{id}"}) 兩個路徑同控制器
	@GetMapping(value = "/deleteCustomer/{id}")
	public ModelAndView deleteCustomer (ModelAndView mav, @PathVariable Integer id ) {
		service.deleteMemberById(id);
		
		mav.setViewName("redirect:/viewCustomer/1");
		return mav;
	}
}
