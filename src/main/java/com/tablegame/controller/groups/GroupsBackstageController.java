package com.tablegame.controller.groups;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.group.GroupBean;
import com.tablegame.model.bean.product.Product;
import com.tablegame.service.groups.GroupsService;

@Controller
@RequestMapping("/backstage/groups")
public class GroupsBackstageController {
	@Autowired
	GroupsService service;
	
	
	
	@GetMapping("")
	public ModelAndView getProd(ModelAndView mav) {
		List<GroupBean> groups = service.getAllGroups();
		Map<Integer, Integer> playerNumPerGroup = service.getAllPlayerNumMap();
		List<Product> prods = service.getAllProductBean();
		mav.getModel().put("groups", groups);
		mav.getModel().put("playerNumPerGroup", playerNumPerGroup);
		mav.getModel().put("products", prods);
		mav.setViewName("/groups/backstageView");
		return mav;
	}
	
	@GetMapping("/DeleteGroup/{groupId}")
	public ModelAndView deleteGroup(ModelAndView mav,@PathVariable int groupId) {
		service.delectGroupById(groupId);
		mav.setViewName("redirect:/backstage/groups");
		return mav;
	}
	

}
