package com.tablegame.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tablegame.dto.PwdForm;
import com.tablegame.dto.googleLoginDto;
import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.member.RatingsBean;
import com.tablegame.service.member.MembersService;

@Controller
public class PageController {

	private static final Object PwdForm = null;

	@Autowired
	private MembersService service;

	@Autowired
	private MembersBean member;

	@GetMapping(value = "/login")
	public String login() {
		return "login";
	}

	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping(value = "/black")
	public String blackPage() {
		return "membersPage/black";
	}

	@GetMapping(value = "/accountServer")
	public String accountServer() {
		return "membersPage/accountServer";
	}

	@GetMapping(value = "/accountProblem")
	public String accountProblem() {
		return "membersPage/accountProblem";
	}

	@PostMapping(value = "/login")
	public ModelAndView checkLogin(ModelAndView mav, @RequestParam(name = "email") String email,
			@RequestParam(name = "pwd") String pwd, HttpServletRequest request) {
		HttpSession session = request.getSession();
		boolean option = service.checkLogin(email, pwd);
		if (option) {
			Integer level = service.checkLevel(email);
			MembersBean memberBean = service.findByEmail(email);
			session.setAttribute("member", memberBean);
			member.setLoginCount(0);
			switch (level) {
			case 1:
				mav.setViewName("redirect:/");
				break;
			case 2:
				mav.setViewName("membersPage/employeePage");
				break;
			default:
				mav.setViewName("redirect:/");
			}
			return mav;
		} else {
			if (member.getLoginCount() < 2) {
				mav.setViewName("redirect:/login");
				member.setLoginCount(member.getLoginCount() + 1);
				System.out.println(member.getLoginCount());
				return mav;
			} else {
				member.setLoginCount(0);
				System.out.println(member.getLoginCount());
				mav.setViewName("redirect:/black");
				return mav;
			}

		}
	}

	@GetMapping(value = "/addManager")
	public ModelAndView managerAdd(ModelAndView mav) {
		MembersBean addManager = new MembersBean();

		mav.getModel().put("addManager", addManager);
		mav.setViewName("membersPage/managerAddPage");
		return mav;
	}

	@GetMapping(value = "/viewMembers/{pageNumber}")
	public ModelAndView viewMembers(ModelAndView mav, @PathVariable Integer pageNumber) {
		Page<MembersBean> members = service.findMembers(pageNumber);
		mav.getModel().put("members", members);
		mav.setViewName("membersPage/managerViewMember");
		return mav;
	}

	@GetMapping(value = "/viewCustomer/{pageNumber}")
	public ModelAndView viewCustomers(ModelAndView mav, @PathVariable Integer pageNumber) {
		Page<MembersBean> customers = service.findCustomers(pageNumber);
		mav.getModel().put("customers", customers);
		mav.setViewName("membersPage/managerViewCustomer");
		return mav;
	}

	@GetMapping(value = "/customerEditSelf")
	public ModelAndView editSelfCustomer(ModelAndView mav, HttpSession session) {
		MembersBean logCustomer = (MembersBean) session.getAttribute("member");
		Integer loginCustomerId = logCustomer.getId();

		MembersBean nowCostomer = service.findMemberById(loginCustomerId);

		mav.getModel().put("customer", nowCostomer);
		mav.setViewName("membersPage/customerEditSelf");
		return mav;
	}

	@GetMapping(value = "/customerView")
	public ModelAndView customerView(ModelAndView mav, HttpSession session) {
		MembersBean logCustomer = (MembersBean) session.getAttribute("member");
		Integer loginCustomerId = logCustomer.getId();

		MembersBean nowCostomer = service.findMemberById(loginCustomerId); // ????????????????????????

//		System.out.println(logCustomer.getCusName()); ////?????????Session????????????
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

	@ResponseBody
	@PostMapping(value = "/ajax/googlelogin")
	public MembersBean googleLogin(@RequestBody googleLoginDto dto, ModelAndView mav, HttpSession session) {
		String email = dto.getEmail();
		String name  = dto.getName();
		MembersBean memberBean = service.findByGoogleEmail(email, name);

		session.setAttribute("member", memberBean);
		mav.setViewName("redirect:/");
		return memberBean;
	}

	@ModelAttribute(name = "ratingMap")
	public Map<Integer, String> getRatingMap() {
		Map<Integer, String> ratingMap = new HashMap<>();
		List<RatingsBean> ratingList = service.findAllRatings();
		for (int i = 0; i < 2; i++) {
			Integer key = ratingList.get(i).getId();
			String value = ratingList.get(i).getRateName();
			ratingMap.put(key, value);
		}
		return ratingMap;
	}

	@RequestMapping("/pwd")
	public String pwd(Model model, HttpServletRequest req) {
		PwdForm pwdForm = new PwdForm();
		model.addAttribute("PwdForm", PwdForm);
		model.addAttribute("loginErrorMsg", req.getAttribute("loginErrorMsg"));
		return "pwd";
	}

	@PostMapping("/pwdSubmit")
	public String pwdSubmit(@Valid @ModelAttribute(name = "PwdForm") PwdForm pwdForm, BindingResult rs,

			Model model, HttpSession hs) {
//		System.out.println("00000000000000000"+pwdForm.getEmail());

		service.pwd(pwdForm.getEmail(), pwdForm.getPwd());
		return "forward:/pwd";
	}

	@GetMapping(value = "/query")
	public ModelAndView query(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		MembersBean nowCostomer = service.findMemberById(id); // ????????????????????????


//		System.out.println(logCustomer.getCusName()); ////?????????Session????????????
		mav.getModel().put("query", nowCostomer);
		mav.setViewName("membersPage/query");
		return mav;
	}
//??????OK
	@PostMapping("/querySubmit")
	public String querySubmit(@Valid @ModelAttribute(name = "query") MembersBean bean, Model model, HttpSession hs) {
		
		MembersBean res=service.insertMember(bean);
		

	return "membersPage/query";


	}
//	@PostMapping("/querySubmit")
//
//	public ModelAndView viewCustomers(@Valid @ModelAttribute(name = "query") MembersBean bean, Model model, HttpSession hs ,ModelAndView mav, @PathVariable Integer pageNumber) {
//		
//		MembersBean res=service.insertMember(bean);
////		
//		
//		mav.getModel().put("customers", customers);
//		mav.setViewName("membersPage/managerViewCustomer");
//		return mav;
//	}



}
