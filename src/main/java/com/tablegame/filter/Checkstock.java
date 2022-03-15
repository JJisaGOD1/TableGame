package com.tablegame.filter;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.springframework.beans.factory.annotation.Autowired;

import com.tablegame.model.bean.product.Product;
import com.tablegame.model.bean.product.ProductImformation;
import com.tablegame.service.product.PIService;
import com.tablegame.service.product.ProductService;

@WebFilter(urlPatterns = { "/products/*" })
public class Checkstock implements Filter {

	public Checkstock() {
	}

	public void destroy() {
	}

	@Autowired
	private ProductService sevice;

	@Autowired
	private PIService seviceI;

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {

		chain.doFilter(arg0, arg1);
		List<Product> plist = sevice.findAllProducts();
		for (Product product : plist) {
			Integer stock = product.getStock();
			String sellstatus = product.getSellstatus();
			if (stock <= 20) {
				if ("上架中".equals(sellstatus)) {
					Date d = new Date();
					product.setSellstatus("下架中");
					sevice.insert(product);
					ProductImformation newhistory = seviceI.createBean("自動下架", stock, d, product.getProduct_id());
					seviceI.insert(newhistory);
				}
			}
		}

	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
}
