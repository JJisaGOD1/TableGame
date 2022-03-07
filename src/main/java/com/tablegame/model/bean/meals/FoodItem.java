package com.tablegame.model.bean.meals;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


public class FoodItem implements Serializable {
	
	private FoodList food;
	private Integer quantity;
	private double price; //該項目總價 foodPrice * quantity = price

	
	public FoodItem() {
		// TODO Auto-generated constructor stub
	}


	public FoodList getFood() {
		return food;
	}


	public void setFood(FoodList food) {
		this.food = food;
	}


	public Integer getQuantity() {
		return quantity;
	}


	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


	public double getPrice() {
		return food.getFoodPrice() * this.quantity;
	}


	public void setPrice(double price) {
		this.price = price;
	}
	
	


	
	
	
}
