package com.tablegame.model.repository.product;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tablegame.model.bean.product.OrderList;

public interface OrderListRepository extends JpaRepository<OrderList, Integer> {

}
