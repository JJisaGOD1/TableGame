package com.tablegame.service.product;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.tablegame.model.bean.product.ProductImformation;
import com.tablegame.model.repository.product.PIRepository;



@Service
public class PIService {

	@Autowired
	private PIRepository daoPi;

	public void insert(ProductImformation Pi) {
		daoPi.save(Pi);
	}

	public void delete(Integer id) {
		daoPi.deleteById(id);
	}

	public List<ProductImformation> findAllProducts() {
		List<ProductImformation> Pi = daoPi.findAll();

		return Pi;
	}

	public List<ProductImformation> findById(Integer Id) {
		List<ProductImformation> Pi = daoPi.findIById(Id);

		return Pi;
	}

	public ProductImformation findLastHistoryById(Integer Id) {
		ProductImformation Pi = daoPi.findLastHistoryById(Id);

		return Pi;

	}

	public void updateInsert(Integer id, Integer stock, String history) {
		daoPi.updateInsert(id, stock, history);
	}

	public ProductImformation createBean(String History, Integer stock, Date date, Integer id) {
		ProductImformation PI = new ProductImformation();
		PI.setHistory(History);
		PI.setChangedate(date);
		PI.setStock(stock);
		PI.setProductid_id(id);
		return PI;
	}
}