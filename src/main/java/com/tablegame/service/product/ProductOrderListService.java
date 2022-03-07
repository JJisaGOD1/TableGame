package com.tablegame.service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.product.ProductOrderList;
import com.tablegame.model.bean.product.ProductOrders;
import com.tablegame.model.bean.product.Product;
import com.tablegame.model.repository.product.ProductOrderListRepository;


@Service
public class ProductOrderListService {

	@Autowired
	private ProductOrderListRepository dao;

	public void insert(ProductOrderList orderlist) {
		dao.save(orderlist);
	}

	public ProductOrderList createbean(Integer quantity, Double price, ProductOrders orders, Product product) {
		ProductOrderList orderlist = new ProductOrderList();
		orderlist.setQuantity(quantity);
		orderlist.setPrice(price);
		orderlist.setOrders(orders);
		orderlist.setProduct(product);
		return orderlist;
	}

}
