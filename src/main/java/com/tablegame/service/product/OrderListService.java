package com.tablegame.service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.product.OrderList;
import com.tablegame.model.bean.product.Orders;
import com.tablegame.model.bean.product.Product;
import com.tablegame.model.repository.product.OrderListRepository;


@Service
public class OrderListService {

	@Autowired
	private OrderListRepository dao;

	public void insert(OrderList orderlist) {
		dao.save(orderlist);
	}

	public OrderList createbean(Integer quantity, Double price, Orders orders, Product product) {
		OrderList orderlist = new OrderList();
		orderlist.setQuantity(quantity);
		orderlist.setPrice(price);
		orderlist.setOrders(orders);
		orderlist.setProduct(product);
		return orderlist;
	}

}
