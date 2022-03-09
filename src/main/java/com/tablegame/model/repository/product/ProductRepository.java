package com.tablegame.model.repository.product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tablegame.model.bean.product.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

	List<Product> findByproductNameLike(String name);

	@Query(value = "select problem_count from Product where product_name=:product_name", nativeQuery = true)
	public String selectproblemCountbyproductName(@Param(value = "product_name") String productName);

}
