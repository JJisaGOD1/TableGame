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
import com.tablegame.model.bean.product.ProductOrders;
import com.tablegame.model.repository.product.ProductOrdersRepository;

@Service
public class ProductOrdersService {

	@Autowired
	private ProductOrdersRepository dao;

	public void insert(ProductOrders orders) {
		dao.save(orders);
	}

	public ProductOrders createBean(String processingstatus, MembersBean member, Date date, Double price) {
		ProductOrders orders = new ProductOrders();
		orders.setProcessingstatus(processingstatus);// "未處裡"
		orders.setMember(member);// serviceM.findByName(username)
		orders.setOrder_date(date);// date
		orders.setTotalprice(price);// cart.getPrice()
		return orders;
	}

	public List<ProductOrders> findAll() {
		List<ProductOrders> all = dao.findAll();
		return all;
	}

	public Page<ProductOrders> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "orderId");

		return dao.findAll(pgb);
	}

	public ProductOrders findById(Integer id) {
		Optional<ProductOrders> a = dao.findById(id);
		if (a.isPresent()) {
			ProductOrders aa = a.get();
			return aa;
		}
		return null;
	}

	public Page<ProductOrders> findmyorderPage(Integer id, Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "customer_id");

		return dao.findByCustomerId(id, pgb);
	}
}
