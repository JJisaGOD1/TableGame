package com.tablegame.service.member;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.member.RatingsBean;
import com.tablegame.model.repository.member.MembersRepository;
import com.tablegame.model.repository.member.RatingsRepository;

@Service
public class MembersService {
	
	@Autowired
	private  MembersRepository memDao;
	
	@Autowired
	private RatingsRepository rateDao;
	
	public boolean checkLogin(String email, String pwd) {
		Optional<MembersBean> option = memDao.findByEmail(email);
		if(option.isEmpty() || !option.get().getPwd().equals(pwd)) {
			return false;
		}
		return true;
	}
	public Integer checkLevel(String email) {
		Optional<MembersBean> option = memDao.findByEmail(email);
		Integer level = option.get().getRatingsBean().getId();
		
		return level;
	}
	
	public List<RatingsBean> findAllRatings() {
		List<RatingsBean> res = rateDao.findAll();
		return res;
	}
	
	public Page<MembersBean> findMembers(Integer pageNumber) {
		Integer rating1 =rateDao.findById(1).get().getId();
		Integer rating2 =rateDao.findById(2).get().getId();
		Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.ASC, "fk_rating_id");
		Page<MembersBean> res = memDao.findByRatingMember(rating1, rating2, pgb);
		System.out.println(res.getContent().get(0).getBirthday()+"115314666666666");
		return res;	
	}
	public Page<MembersBean> findCustomers(Integer pageNumber) {
		Integer rating3 =rateDao.findById(3).get().getId();
		Pageable pgb = PageRequest.of(pageNumber-1, 10, Sort.Direction.ASC, "created_time");
		Page<MembersBean> res = memDao.findByRatingCustomer(rating3, pgb);
		return res;
	}
	
	public MembersBean findMemberById(Integer id) {
		Optional<MembersBean> option = memDao.findById(id);
		MembersBean res = option.get();
		return res;
	}
	
	public MembersBean insertMember(MembersBean member) {
		System.out.println(member.getRatingsBean().getRateName());
		MembersBean res = memDao.save(member);
		return res;
	}
	
	public MembersBean findByEmail(String email) {
		Optional<MembersBean> option = memDao.findByEmail(email);
		MembersBean memberBean = option.get();
		return memberBean;
	}
	
	public void deleteMemberById(Integer id) {
		memDao.deleteById(id);
	}
	
	//忘記密碼
	public void  pwd(String email, String newpwd) {
		Optional<MembersBean> op = memDao.findByEmail(email);

		if (op.isPresent()) {
			MembersBean member = op.get();

			member.setPwd(newpwd);
			
			memDao.save(member);
		}
}
	
	
	
	
	
//	修改
//	public void query(QueryForm queryForm) {
//		Optional<Member> op = dao.findByEmail(queryForm.getEmail());
//
//		if (op.isPresent()) {
//			Member member = op.get();
//	
//			member.setCustomerName(queryForm.getCustomerName());
//			member.setPwd(queryForm.getPwd());
//			
//			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//			try {
//				member.setBirthday(sdf.parse(queryForm.getBirthday()));
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
//			member.setStreet(queryForm.getStreet());
//			member.setPhone(queryForm.getPhone());
//
//			dao.save(member);
//		}
//	}
}
