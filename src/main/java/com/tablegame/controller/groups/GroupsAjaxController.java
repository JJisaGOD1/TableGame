package com.tablegame.controller.groups;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.dto.ParticipantsDto;
import com.tablegame.dto.ProductIdDto;
import com.tablegame.model.bean.group.GroupBean;
import com.tablegame.model.bean.product.Product;
import com.tablegame.service.groups.GroupsService;
import com.tablegame.service.member.MembersService;



@RestController //A convenience annotation that is itself annotated with @Controller and @ResponseBody
public class GroupsAjaxController {
	@Autowired
	GroupsService service;
	
	@Autowired 
	MembersService memberService;
	
	@PostMapping("/groups/changeMaxNums")
	public Product getProd(@RequestBody ProductIdDto json) {
		String prodId = json.getProductId();
		Product prod = service.getProductBean(Integer.parseInt(prodId));
		return prod;
	}
	
	
//	@GetMapping("/backstage/groups/Participants/{groupId}")
//	public List<ParticipantsDto> getParticipants(@PathVariable int groupId) {
//		List<ParticipantsDto> psdto = service.getParticipantsDtoByGroupId(groupId);
//		return psdto;
//	}
	
	@GetMapping("/backstage/groups/Participants/{groupId}")
	public ResponseEntity<?> getParticipants(@PathVariable int groupId) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ParticipantsDto> psdto = service.getParticipantsDtoByGroupId(groupId);
		GroupBean group = service.getGroupsById(groupId);
		List<Product> prods = service.getAllProductBean();
		map.put("group", group);
		map.put("participants", psdto);
		map.put("prods", prods);
		return ResponseEntity.ok(map);
	}
	
	@GetMapping("/backstage/groups/DeleteJoiner/{groupId}/{participantId}")
	public ResponseEntity<?> deleteJoiner(@PathVariable int groupId,
			@PathVariable int participantId) {
		
		service.quitTheGroup(memberService.findMemberById(participantId),groupId);
		ResponseEntity<?> map = this.getParticipants(groupId);
		
		return map;
	}
	
	
	
}
