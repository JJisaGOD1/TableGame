package com.tablegame.dto;

import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import com.tablegame.model.bean.product.CartItem;

public class Cart implements Serializable {

	private Map<Integer, CartItem> productMap = new LinkedHashMap<Integer, CartItem>();

	private double price;// 代表著購物車的總價

	public Map<Integer, CartItem> getProductMap() {
		return productMap;
	}

	public void setProductMap(Map<Integer, CartItem> productMap) {
		this.productMap = productMap;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getPrice() {
		double totalPrice = 0;
		for (Entry<Integer, CartItem> me : productMap.entrySet()) {
			// 得到每個購物項
			CartItem cartItem = me.getValue();
			// 將每個購物項的錢加起來，就是購物車的總價了！
			totalPrice = cartItem.getPrice() + totalPrice;
		}
		return totalPrice;
	}
}
