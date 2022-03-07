package com.tablegame.model.repository.product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tablegame.model.bean.product.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

	List<Product> findByproductNameLike(String name);

}
