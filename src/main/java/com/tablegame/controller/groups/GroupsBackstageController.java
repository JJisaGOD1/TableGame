package com.tablegame.controller.groups;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.dto.ProductIdDto;
import com.tablegame.model.bean.product.Product;

@Controller
public class GroupsBackstageController {
	@GetMapping("/backstage/groups")
	public ModelAndView getProd(ModelAndView mav) {
		mav.setViewName("groups/backstageView");
		return mav;
	}
}
