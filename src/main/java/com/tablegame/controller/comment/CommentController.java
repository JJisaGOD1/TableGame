package com.tablegame.controller.comment;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.model.bean.comment.CommentsBean;
import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.product.Product;
import com.tablegame.service.comment.CommentsService;

@Controller
public class CommentController {

	@Autowired
	private CommentsService service;
	
	//增加留言-非產品向
	@PostMapping(value = "/addComment")
	public ModelAndView addComment(ModelAndView mav, 
			@ModelAttribute(name = "Comments") CommentsBean comment, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MembersBean member = (MembersBean)session.getAttribute("member");
		String name = member.getCusName();
		service.insertComment(comment, name);
		
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//增加留言-產品向
	@PostMapping(value = "/addComment", params = {"product"} )
	public ModelAndView addComment(ModelAndView mav, 
			@ModelAttribute(name = "Comments") CommentsBean comment, 
			@RequestParam(name = "product") Integer product, HttpServletRequest request) {
		//Integer product = Integer.valueOf(request.getParameter("product"));
		
		HttpSession session = request.getSession();
		MembersBean member = (MembersBean)session.getAttribute("member");
		String name = member.getCusName();
		service.insertCommentHasProduct(comment,product,name);
		
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//後台刪除留言
	@GetMapping(value = "/deleteComment")
	public ModelAndView deleteComment(ModelAndView mav, 
							@RequestParam(name = "id") Integer id) {
		
		service.deleteById(id);
		mav.setViewName("redirect:/viewComments");
		return mav;
	}
	
	//前台刪除留言
	@GetMapping(value = "/deleteComment/{id}")
	public ModelAndView deleteCommentForName(ModelAndView mav, 
							@PathVariable(name = "id") Integer id) {
		
		service.deleteById(id);
		mav.setViewName("redirect:/nameComments/1");
		return mav;
	}
	
	//後台編輯回覆POST送出-非產品向
	@PostMapping(value = "/editComment")
	public ModelAndView editComment(ModelAndView mav, 
			@ModelAttribute(name = "editComment") CommentsBean comment, HttpServletRequest request) {
		
		String name = request.getParameter("name");
		service.insertComment(comment, name);
		
		mav.setViewName("redirect:/viewComments");
		return mav;
	}
	
	//後台編輯回覆POST送出-產品向
	@PostMapping(value = "/editComment", params = {"product"} )
	public ModelAndView editComment(ModelAndView mav, 
			@ModelAttribute(name = "editComment") CommentsBean comment, 
			@RequestParam(name = "product") Integer product, HttpServletRequest request) {

		String name = request.getParameter("name");
		service.insertCommentHasProduct(comment, product, name);
		
		mav.setViewName("redirect:/viewComments");
		return mav;
	}
	
	//前台會員編輯POST送出-非產品向
	@PostMapping(value = "/editNameComment")
	public ModelAndView editNameComment(ModelAndView mav, 
			@ModelAttribute(name = "editComment") CommentsBean comment, HttpServletRequest request) {
		
		String name = request.getParameter("name");
		service.insertComment(comment, name);
		
		mav.setViewName("redirect:/nameComments/1");
		return mav;
	}
	
	//前台會員編輯POST送出-產品向
	@PostMapping(value = "/editNameComment", params = {"product"} )
	public ModelAndView editNameComment(ModelAndView mav, 
			@ModelAttribute(name = "editComment") CommentsBean comment, 
			@RequestParam(name = "product") Integer product, HttpServletRequest request) {

		String name = request.getParameter("name");
		service.insertCommentHasProduct(comment, product, name);
		
		mav.setViewName("redirect:/nameComments/1");
		return mav;
	}
	
	//產品欄位請求
	@ResponseBody
	@GetMapping(value = "/ajax/product")
	public Map<Integer, String> getProductMap() {
		 Map<Integer, String> productMap = new HashMap<>();
		 List<Product> productList = service.getProductList();
		 for(Product pb :productList) {
			 productMap.put(pb.getProduct_id(), pb.getProduct_name());
		 }
		 return productMap;
	}
	
	//後台根據回覆情況搜尋
	@GetMapping(value = "conditions/viewComments/{conditionId}")
	public ModelAndView viewConditionMessagePage(ModelAndView mav, 
			@PathVariable Integer conditionId, 
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		 Page<CommentsBean> page = service.findByConditionsId(conditionId, pageNumber);
		 mav.setViewName("comments/viewComments");
		 mav.getModel().put("pages", page);
		 return mav;
	}
	
}
