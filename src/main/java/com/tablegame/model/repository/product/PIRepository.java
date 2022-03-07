package com.tablegame.model.repository.product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tablegame.model.bean.product.ProductImformation;

public interface PIRepository extends JpaRepository<ProductImformation, Integer> {

	@Query(value = "select * from Product_information where productid_id = :productid_id", nativeQuery = true)
	public List<ProductImformation> findIById(@Param(value = "productid_id") Integer id);

	@Query(value = "select top 1 *  from Product_information where productid_id = :productid_id  ORDER By productinformation_id desc", nativeQuery = true)
	public ProductImformation findLastHistoryById(@Param(value = "productid_id") Integer id);

//	@Query(value = "Select  * From product_information a Where changedate = (Select Max(b.changedate) From product_information b Where a.productid_id = b.productid_id  ) ORDER BY productid_id ASC", nativeQuery = true)
//	public List<ProductImformation> findAllLastHistory();

	@Query(value = "insert into product_information(productid_id,stock,history)values (:productid_id,:stock,:history) ", nativeQuery = true)
	public void updateInsert(@Param(value = "productid_id") Integer id, @Param(value = "stock") Integer stock,
			@Param(value = "history") String history);
}
