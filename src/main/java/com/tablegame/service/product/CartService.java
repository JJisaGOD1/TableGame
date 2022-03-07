package com.tablegame.service.product;

import java.util.Map;

import org.springframework.stereotype.Service;


import com.tablegame.model.bean.product.CartItem;
import com.tablegame.model.bean.product.Product;

@Service
public class CartService {

	public void addProduct(Product product, Map<Integer, CartItem> productMap, Integer quantity) {
		// 獲取得到購物項
		CartItem cartItem = productMap.get(product.getProduct_id());
		// 判斷購物車是否存在該購物項，如果不存在
		if (cartItem == null) {
			// 建立這個購物項物件
			cartItem = new CartItem();
			// 將使用者傳遞過來的商品作為購物項
			cartItem.setProduct(product);
			// 把該購物項的數量設定為1
			cartItem.setQuantity(quantity);
			// 把購物項加入到購物車去
			productMap.put(product.getProduct_id(), cartItem);
		} else {
			// 如果存在該購物項，將購物項的數量+1
			cartItem.setQuantity(cartItem.getQuantity() + quantity);
		}
	}

	public void deleteProduct(Product product, Map<Integer, CartItem> productMap) {
		CartItem cartItem = productMap.get(product.getProduct_id());
		if (cartItem.getQuantity() > 1) {
			cartItem.setQuantity(cartItem.getQuantity() - 1);
		} else if (cartItem.getQuantity() == 1) {
			productMap.remove(product.getProduct_id());
		}
	}

	public void deleteOneProduct(Product product, Map<Integer, CartItem> productMap) {
		productMap.remove(product.getProduct_id());
	}
}
