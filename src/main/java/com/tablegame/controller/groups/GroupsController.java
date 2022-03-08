package com.tablegame.controller.groups;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tablegame.model.bean.group.GroupBean;
import com.tablegame.model.bean.group.ParticipantBean;
import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.product.Product;
import com.tablegame.service.groups.GroupsService;



@Controller
@RequestMapping("/groups")
public class GroupsController {
	@Autowired
	GroupsService service;

	@GetMapping("/ChooseDate")
	public String choose() {
		return "groups/ChooseDateView";
	}

	@RequestMapping(value = "/TheDateState/{intYear}/{intMonth}/{intDay}",method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView theDateStateAction(
			ModelAndView mav,
			HttpSession hs,
//			@RequestParam(name = "date")  String date,
			@PathVariable int intYear,
			@PathVariable int intMonth,
			@PathVariable int intDay) {
		String date=intYear+"/"+intMonth+"/"+intDay;
		hs.setAttribute("date", date);
		date=(String)hs.getAttribute("date");
		MembersBean user = (MembersBean)(hs.getAttribute("member"));
		
		List<GroupBean> groups = service.getGroupsByDate(date);
		Map<Integer,Integer> perGroupNumMap=service.getPlayerNumMapByDate(date);
		Map<Integer,Integer> oneJoinedGroups = service.getGroupsUsersMap(user,groups);
		Map<Integer,Integer> oneJoinedNumMap = service.getOneJoinedNumMap(user,date);
		
		mav.getModel().put("groups", groups);
		mav.getModel().put("date", date);
		
		//每團人數
		mav.getModel().put("perGroupNumMap", perGroupNumMap);
		
		//k:當天所有團 v:當前使用者
		mav.getModel().put("oneJoinedGroups", oneJoinedGroups);
		
		//k:加入者 v:加入者帶之人數
		mav.getModel().put("oneJoinedNumMap", oneJoinedNumMap);
		
		mav.setViewName("groups/TheDateStateView");
		return mav;
	}

	@RequestMapping("/FillNewGroupData")
	public ModelAndView fillNewGroupData(
			ModelAndView mav, 
//			@RequestParam(name = "date") String date,
			HttpSession hs
			) {
		List<Product> allProds = service.getAllProductBean();
		String date = (String) hs.getAttribute("date");
		mav.getModel().put("date", date);
		mav.getModel().put("products", allProds);
		mav.setViewName("groups/FillNewGroupDataView");
		return mav;
	}

	@PostMapping("/InsertNewGroup")
	public ModelAndView insertNewGroup(ModelAndView mav, RedirectAttributes attr, HttpSession hs,
//			@RequestParam(name = "date") String date, 
			@RequestParam(name = "product") String productId,
			@RequestParam(name = "playersNumWithLauncher") String playersNumWithLauncher,
			@RequestParam(name = "introduction") String introduction) {
		MembersBean launcher = (MembersBean) hs.getAttribute("member");
		String date = (String) hs.getAttribute("date");
		service.insertNewGroup(launcher, date, productId, playersNumWithLauncher, introduction);
		
		
//		mav.getModel().put("date", date);
		System.out.println(date);
		attr.addFlashAttribute("date", date);
		mav.setViewName("redirect:TheDateState/" + date);

		return mav;
	}

	@GetMapping("/DeleteGroup/{groupId}")
	public ModelAndView deleteGroup(ModelAndView mav, RedirectAttributes attr, HttpSession hs,
			@PathVariable int groupId) {
		MembersBean launcher = (MembersBean) hs.getAttribute("member");
		service.delectGroupById(groupId, launcher);
		String date = (String) hs.getAttribute("date");
		attr.addFlashAttribute("date", date);
		mav.setViewName("redirect:/groups/TheDateState/" + date);
		return mav;
	}



	@GetMapping("/ToJoin/{groupId}")
	public ModelAndView toJoin(ModelAndView mav, HttpSession hs, RedirectAttributes attr, @PathVariable int groupId) {
		MembersBean participant = (MembersBean) hs.getAttribute("member");
		GroupBean group = service.getGroupsById(groupId);

		int[] theGroupNum = service.getTheGroupNum(groupId);
		int playersNumNow = theGroupNum[0];
		int remainingNum = theGroupNum[1];

		mav.getModel().put("playersNumNow", playersNumNow);
		mav.getModel().put("remainingNum", remainingNum);
		mav.getModel().put("group", group);
		mav.setViewName("groups/ToJoinView");
		return mav;
	}

	@PostMapping("/Join")
	public ModelAndView join(ModelAndView mav, HttpSession hs, @RequestParam int groupId,
			@RequestParam int joinPlayersNum) {
		MembersBean participant = (MembersBean) hs.getAttribute("member");
		service.insertNewParticipant(participant, groupId, joinPlayersNum);
		String date = (String) hs.getAttribute("date");

		mav.setViewName("redirect:/groups/TheDateState/" + date);
		return mav;
	}
	
	@GetMapping("/Quit/{groupId}")
	public ModelAndView quit(ModelAndView mav, HttpSession hs, @PathVariable int groupId) {
		MembersBean participant = (MembersBean) hs.getAttribute("member");
		service.quitTheGroup(participant,groupId);
		String date = (String) hs.getAttribute("date");
		mav.setViewName("redirect:/groups/TheDateState/" + date);
		return mav;
	}
	
	@GetMapping("/ToUpdateParticipantData/{groupId}")
	public ModelAndView toUpdateParticipantData(ModelAndView mav, HttpSession hs, @PathVariable int groupId) {
		MembersBean joiner = (MembersBean) hs.getAttribute("member");
		
		GroupBean group = service.getGroupsById(groupId);
		int[] theGroupNum = service.getTheGroupNum(groupId);
		int remainingNum = theGroupNum[1];
		ParticipantBean participant=service.getParticipantById(joiner.getId(),groupId);
		int participantNumNow = participant.getParticipantNum();
		remainingNum=remainingNum+participantNumNow;
		
		
		mav.getModel().put("group", group);
		mav.getModel().put("participantNumNow", participantNumNow);
		mav.getModel().put("remainingNum", remainingNum);
		mav.setViewName("groups/ToUpdateParticipantDataView");
		return mav;
	}
	
	@GetMapping("/UpdateParticipant/{groupId}")
	public ModelAndView updateParticipant(ModelAndView mav, HttpSession hs,
			@PathVariable int groupId,
			@RequestParam int updateNum) {
		MembersBean joiner = (MembersBean) hs.getAttribute("member");
		String date = (String) hs.getAttribute("date");
		
		service.updateParticipantNum(joiner,groupId,updateNum);
		
		mav.setViewName("redirect:/groups/TheDateState/" + date);
		return mav;
	}
	
	@GetMapping("/ToUpdateGroupData/{groupId}")
	public ModelAndView toUpdateGroupData(ModelAndView mav, HttpSession hs, @PathVariable int groupId) {
		MembersBean launcher = (MembersBean) hs.getAttribute("member");
		GroupBean group = service.getGroupsById(groupId);
		List<Product> allProds = service.getAllProductBean();
		
		//copy ToUpdateParticipantData的code 
		int[] theGroupNum = service.getTheGroupNum(groupId);
		int playersNumNow = theGroupNum[0];
		int remainingNum = theGroupNum[1];
		ParticipantBean participant=service.getParticipantById(launcher.getId(),groupId);
		int launcherPlayerNow=participant.getParticipantNum();
		remainingNum=remainingNum+launcherPlayerNow;
		

		mav.getModel().put("playersNumNow", playersNumNow);
		mav.getModel().put("launcherPlayerNow", launcherPlayerNow);
		mav.getModel().put("remainingNum", remainingNum);
		
		mav.getModel().put("group", group);
		mav.getModel().put("products", allProds);

		mav.setViewName("groups/ToUpdateGroupDataView");
		return mav;
	}
	
	@PostMapping("/UpdateGroupData/{groupId}")
	public ModelAndView updateGroupData(
			ModelAndView mav,
			HttpSession hs, 
			@PathVariable int groupId,
			@RequestParam(name = "updateProduct") int productId,
			@RequestParam(name = "updateNum") int updateNum,
			@RequestParam(name = "updateIntroduction") String updateIntroduction
			) {
		String date = (String) hs.getAttribute("date");
		service.updateGroupDate(groupId,productId,updateNum,updateIntroduction);
		
		mav.setViewName("redirect:/groups/TheDateState/" + date);
		return mav;
	}
}
