package com.tablegame.service.booking;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.booking.Booking;
import com.tablegame.model.repository.booking.BookingRepostitory;
import com.tablegame.model.repository.member.MembersRepository;




@Service
public class BookingService { 
	@Autowired
	 private MembersRepository loginDao;
	
	@Autowired
    private BookingRepostitory bookingDao;
	//會員登入
//	public MembersBean getUser(String username,String password) {
//		Optional<MembersBean> user = loginDao.findByUsernameAndPwd(username, password);
//		if(user.isPresent()) {
//			return user.get();
//		}
//		return null;
//
//}
	
	public void insert(Booking messages) {
		bookingDao.save(messages);
	}
	
	public List<Booking> findAllbooking() {
		List<Booking> allbooking=bookingDao.findAll();
		return allbooking;
	}
	
	//分頁 controller也要開 
//	public Page<Booking> findByPage(Integer pageNumber){
//		Pageable pgb = PageRequest.of(pageNumber -1, 8, Sort.Direction.DESC,"added");
//		
//		return bookingDao.findAll(pgb);
//	}
	
	public List<Booking> findByLoginId(Integer loginId) {
		List<Booking> allbooking=bookingDao.findByLoginId(loginId);
		return allbooking;
	}
	
	
	public Booking findById(Integer order_id) {
		Optional<Booking> op = bookingDao.findById(order_id);
	    
		if(op.isPresent()) {
			return op.get();
		}
		  
		  return null;
	}
	
	
	public void delete(Integer order_id) {
		bookingDao.deleteById(order_id);
	}
	
	public List<Booking> findBytime(String date,String period) {
		List<Booking> time=bookingDao.findBytime(date, period);
		return time;
	}
}
