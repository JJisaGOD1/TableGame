package com.tablegame.model.bean.meals;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;


public class OrderCart implements Serializable {
	
	//購物車商品集合
	private Map<Integer,FoodItem> foodMap = new LinkedHashMap<Integer,FoodItem>();
	
	//代表購物車內總金額
	private double totalPrices;

	public Map<Integer, FoodItem> getFoodMap() {
		return foodMap;
	}

	public void setFoodMap(Map<Integer, FoodItem> foodMap) {
		this.foodMap = foodMap;
	}

	public double getTotalPrices() {
		double totalPrices = 0;
		for(Entry<Integer, FoodItem> f : foodMap.entrySet()) {
			//取得每個購物項
			FoodItem foodItem = f.getValue();
			//將每個購物車的項目價格加總，為訂單總金額
			totalPrices = foodItem.getPrice() + totalPrices;
		}
		
		return totalPrices;
	}

	public void setTotalPrices(double totalPrices) {
		this.totalPrices = totalPrices;
	}
	
	
	
	
	
	
	
	
	

}
