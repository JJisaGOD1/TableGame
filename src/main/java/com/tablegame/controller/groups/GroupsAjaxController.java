package com.tablegame.controller.groups;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.origin.SystemEnvironmentOrigin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.dto.ProductIdDto;
import com.tablegame.model.bean.group.ParticipantBean;
import com.tablegame.model.bean.product.Product;
import com.tablegame.service.groups.GroupsService;

import ch.qos.logback.core.net.SyslogOutputStream;



@RestController //A convenience annotation that is itself annotated with @Controller and @ResponseBody
public class GroupsAjaxController {
	@Autowired
	GroupsService service;
	
	@PostMapping("/groups/changeMaxNums")
	public Product getProd(@RequestBody ProductIdDto json) {
		String prodId = json.getProductId();
		Product prod = service.getProductBean(Integer.parseInt(prodId));
		return prod;
	}
	
	
	@GetMapping("/backstage/groups/Participants/{groupId}")
	public List<ParticipantBean> getParticipants(ModelAndView mav,@PathVariable int groupId) {
		System.out.println("99999999999999999");
		List<ParticipantBean> participants = service.getParticipantByGroupId(groupId);
//		System.out.println(participants.get(0).getJoinedTime());
		return participants;
	}
}
