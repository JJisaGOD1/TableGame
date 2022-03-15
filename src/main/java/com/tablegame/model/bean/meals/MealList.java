package com.tablegame.model.bean.meals;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "MealList")
public class MealList {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "meal_list_id")
	private Integer mealListId;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_order_id")
	private MealOrders orders;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_food_id")
	private FoodList foodList;
	
	@Column(name = "price")
	private Double itemPrice;
	
	@Column(name = "quantity")
	private Integer quantity;
	
	
//	@EmbeddedId
//	private MealListPK mealListPK;
//
//	@Embeddable
//	public class MealListPK implements Serializable {
//		@ManyToOne(fetch = FetchType.LAZY)
//		@JoinColumns({ @JoinColumn(name = "fk_order_id", referencedColumnName = "order_id"),
//				@JoinColumn(name = "fk_food_id", referencedColumnName = "food_id") })
//		
//		private FoodList foodList;
//		
//		private Orders orders;
//
//		@Column(name = "food_count")
//		private String foodCount;
//	}

	public MealList() {
		// TODO Auto-generated constructor stub
	}


	public Integer getMealListId() {
		return mealListId;
	}


	public void setMealListId(Integer mealListId) {
		this.mealListId = mealListId;
	}


	public MealOrders getOrders() {
		return orders;
	}


	public void setOrders(MealOrders orders) {
		this.orders = orders;
	}


	public FoodList getFoodList() {
		return foodList;
	}


	public void setFoodList(FoodList foodList) {
		this.foodList = foodList;
	}


	public Double getItemPrice() {
		return itemPrice;
	}


	public void setItemPrice(Double itemPrice) {
		this.itemPrice = itemPrice;
	}


	public Integer getQuantity() {
		return quantity;
	}


	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MealList [mealListId=");
		builder.append(mealListId);
		builder.append(", orders=");
		builder.append(orders);
		builder.append(", foodList=");
		builder.append(foodList);
		builder.append(", itemPrice=");
		builder.append(itemPrice);
		builder.append(", quantity=");
		builder.append(quantity);
		builder.append("]");
		return builder.toString();
	}


	
	
	
	
	
}
