package com.tablegame.model.repository.product;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tablegame.model.bean.product.ProductOrders;

public interface ProductOrdersRepository extends JpaRepository<ProductOrders, Integer> {

	@Query(value = "select * from Orders where customer_id = :customer_id", nativeQuery = true)
	public Page<ProductOrders> findByCustomerId(@Param(value = "customer_id") Integer id, Pageable pageable);

}
