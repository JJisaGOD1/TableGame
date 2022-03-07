package com.tablegame.service.product;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.product.Orders;
import com.tablegame.model.repository.product.OrdersRepository;

@Service
public class OrdersService {

	@Autowired
	private OrdersRepository dao;

	public void insert(Orders orders) {
		dao.save(orders);
	}

	public Orders createBean(String processingstatus, MembersBean member, Date date, Double price) {
		Orders orders = new Orders();
		orders.setProcessingstatus(processingstatus);// "未處裡"
		orders.setMember(member);// serviceM.findByName(username)
		orders.setOrder_date(date);// date
		orders.setTotalprice(price);// cart.getPrice()
		return orders;
	}

	public List<Orders> findAll() {
		List<Orders> all = dao.findAll();
		return all;
	}

	public Page<Orders> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "orderId");

		return dao.findAll(pgb);
	}

	public Orders findById(Integer id) {
		Optional<Orders> a = dao.findById(id);
		if (a.isPresent()) {
			Orders aa = a.get();
			return aa;
		}
		return null;
	}

	public Page<Orders> findmyorderPage(Integer id, Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "customer_id");

		return dao.findByCustomerId(id, pgb);
	}
}
