package com.tablegame.service.product;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.product.Product;
import com.tablegame.model.repository.product.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository dao;

	public void insert(Product product) {
		dao.save(product);
	}

	public Product findById(Integer id) {
		Optional<Product> op = dao.findById(id);

		if (op.isPresent()) {
			return op.get();
		}

		return null;
	}

	public void delete(Integer id) {
		dao.deleteById(id);
	}

	public List<Product> findAllProducts() {
		List<Product> product = dao.findAll();

		return product;
	}

	public Page<Product> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 6, Sort.Direction.DESC, "productId");

		return dao.findAll(pgb);
	}

	public List<Product> findsearchPage(String String) {
		List<Product> a = dao.findByproductNameLike("%" + String + "%");
		return a;
	}

	public Page<Product> listConvertToPage(List<Product> list, Pageable pageable) {
		int start = (int) pageable.getOffset();
		int end = (start + pageable.getPageSize()) > list.size() ? list.size() : (start + pageable.getPageSize());
		return new PageImpl<Product>(list.subList(start, end), pageable, list.size());
	}

	public String selectproblemCountbyproductName(String Name) {
		return dao.selectproblemCountbyproductName(Name);
	}
}