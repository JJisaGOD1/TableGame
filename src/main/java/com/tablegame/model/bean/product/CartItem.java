package com.tablegame.model.bean.product;

public class CartItem {
	private Product product;
	private Integer quantity;
	private double price;// 該項目總價，productprice*quantity

	public double getPrice() {
		return product.getPrice() * this.quantity;
	}

	public Product getProduct() {
		return product;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public void setPrice(double price) {
		this.price = price;
	}

}
