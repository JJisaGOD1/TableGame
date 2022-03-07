package com.tablegame.model.repository.product;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tablegame.model.bean.product.ProductOrderList;

public interface ProductOrderListRepository extends JpaRepository<ProductOrderList, Integer> {

}
