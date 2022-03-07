package com.tablegame.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;


public class ProductIdDto implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@JsonProperty(value = "productId") //客製化key的值
	private String productId;

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	
}
