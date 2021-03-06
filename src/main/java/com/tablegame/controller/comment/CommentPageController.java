package com.tablegame.controller.comment;

import java.util.HashMap;
import java.util.LinkedHashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.comment.CategorysBean;
import com.tablegame.model.bean.comment.CommentsBean;
import com.tablegame.model.bean.comment.ConditionsBean;
import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.product.Item;
import com.tablegame.service.comment.CommentsService;

@Controller
public class CommentPageController {
	
	@Autowired
	private CommentsService service;
	
	//後台看所有留言
	@GetMapping(value = "/viewComments")
	public ModelAndView viewMessagePage(ModelAndView mav, 
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		 Page<CommentsBean> page = service.findByPage(pageNumber);
		 
		 CommentsBean e =new CommentsBean();
		 mav.getModel().put("editComment", e);
		 
		 List<CategorysBean> category = service.getCategoryList();
		 mav.getModel().put("cates", category);
		 
		 List<ConditionsBean> condition = service.getConditionList();
		 mav.getModel().put("conditions", condition);
		 
		 mav.getModel().put("pages", page);
		 mav.setViewName("comments/viewComments");
		 return mav;
	}
	
	//前台新增留言
	@GetMapping(value = "/addComment")
	public ModelAndView addComment(ModelAndView mav) {
		mav.setViewName("comments/addComment");
		
		CommentsBean newComment = new CommentsBean();
		mav.getModel().put("Comments", newComment);
		return mav;
	}
	
	//後台編輯回覆，有下面Ajax應該不需使用
	@GetMapping(value = "/editComment")
	public ModelAndView editComment(ModelAndView mav, 
				@RequestParam(name = "id") Integer id) {
		CommentsBean editComment = service.findById(id);
		mav.getModel().put("editComment", editComment);
		System.out.println(editComment.getMembersBean().getCusName());
		mav.setViewName("comments/editComment");
		return mav;
	}
	
	//彈跳視窗編輯
	@ResponseBody
	@GetMapping(value = "/editAjax")
	public CommentsBean editComment(@RequestParam(name = "id") Integer id) {
		CommentsBean editComment = service.findById(id);
		return editComment;
	}
	//前台客戶訊息編輯
	@GetMapping(value = "/editComment/{id}")
	public ModelAndView editNameComment(ModelAndView mav, 
				@PathVariable(name = "id") Integer id) {
		CommentsBean editComment = service.findById(id);
		mav.getModel().put("editComment", editComment);

		mav.setViewName("comments/editNameComment");
		return mav;
	}
	
	//前台客戶瀏覽自身留言
	@GetMapping(value = "/nameComments/{pageNumber}")
	public ModelAndView nameComments(ModelAndView mav, 
			@PathVariable Integer pageNumber, 
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		MembersBean member = (MembersBean)session.getAttribute("member");
		String name = member.getCusName();
		Integer memberId = service.findMemberIdByName(name);
		Page<CommentsBean> pageComments = service.findByMembersId(memberId, pageNumber);
		
		mav.getModel().put("pageComments", pageComments);
		
		mav.setViewName("comments/nameComments");
		return mav;
	}
	
	//線上客服-Customer
	@GetMapping(value = "/customerService")
	public String customerService() {
		return "comments/customerService";
	}
	
	//線上客服-Server
	@GetMapping(value = "/serverService")
	public String serverService () {
		return "comments/serverService";
	}
	
	//問題回復轉頁
	@GetMapping(value = "/categoryProblem")
	public ModelAndView categoryProblem(ModelAndView mav) {
		mav.setViewName("comments/categoryProblem");
		return mav;
	}
	
	//問題回復資料整理送出
	@ResponseBody
	@PostMapping(value = "/category")
	public Item getCategorysChart() {
		List<HashMap<String,Object>> categoryMap = service.findByCategoryMap();
		
		List<String> cateNames = service.getCategorysName();
		Item item = new Item();
		item.setTitle(cateNames);
		item.setNumber(categoryMap);
		return item;
	}
	
	@ModelAttribute(name = "categoryMap")
	public Map<Integer, String> getCategoryMap() {
		 Map<Integer, String> categoryMap = new HashMap<>();
		 List<CategorysBean> categoryList = service.getCategoryList();
		 for(CategorysBean cb :categoryList) {
			 categoryMap.put(cb.getId(), cb.getCateName());
		 }
		 return categoryMap;
	}
	
	@ModelAttribute(name = "conditionMap")
	public Map<Integer, String> getConditionList() {
		Map<Integer, String> conditionMap = new HashMap<>();
		List<ConditionsBean> conditionList = service.getConditionList();
		for(ConditionsBean cb : conditionList) {
			conditionMap.put(cb.getId(), cb.getConName());
		}
		return conditionMap;
	}
	@ModelAttribute(name = "firstCondition")
	public Map<Integer, String> getFirstCondition() {
		Map<Integer, String> firstConditionMap = new HashMap<>();
		ConditionsBean firstCon = service.getFirstCondition();
		firstConditionMap.put(firstCon.getId(), firstCon.getConName());
		return firstConditionMap;
	}
		
}
