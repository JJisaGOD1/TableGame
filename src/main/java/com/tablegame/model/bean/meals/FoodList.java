package com.tablegame.model.bean.meals;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "Foods")
public class FoodList implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "food_id")
	private Integer foodId;
	
	@Column(name = "food_name")
	private String foodName;
	
	@Column(name = "food_price")
	private Integer foodPrice;
	
	@Column(name = "food_type")
	private String foodType;
	
	@Column(name = "food_image")
	private String foodImage;
	
	@Column(name = "food_state")
	private String foodState;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "foodList")
    private Set<MealList> mealList = new LinkedHashSet<MealList>();
	
	@Transient
	private MultipartFile file;
	
	

	public MultipartFile getFile() {
		return file;
	}


	public void setFile(MultipartFile file) {
		this.file = file;
	}


	public FoodList() {
		// TODO Auto-generated constructor stub
	}


	public Integer getFoodId() {
		return foodId;
	}


	public void setFoodId(Integer foodId) {
		this.foodId = foodId;
	}


	public String getFoodName() {
		return foodName;
	}


	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}


	public Integer getFoodPrice() {
		return foodPrice;
	}


	public void setFoodPrice(Integer foodPrice) {
		this.foodPrice = foodPrice;
	}


	public String getFoodType() {
		return foodType;
	}


	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}


	public String getFoodImage() {
		return foodImage;
	}


	public void setFoodImage(String foodImage) {
		this.foodImage = foodImage;
	}


	public String getFoodState() {
		return foodState;
	}


	public void setFoodState(String foodState) {
		this.foodState = foodState;
	}


	public Set<MealList> getMealList() {
		return mealList;
	}


	public void setMealList(Set<MealList> mealList) {
		this.mealList = mealList;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FoodList [foodId=");
		builder.append(foodId);
		builder.append(", foodName=");
		builder.append(foodName);
		builder.append(", foodPrice=");
		builder.append(foodPrice);
		builder.append(", foodType=");
		builder.append(foodType);
		builder.append(", foodImage=");
		builder.append(foodImage);
		builder.append(", foodState=");
		builder.append(foodState);
		builder.append(", mealList=");
		builder.append(mealList);
		builder.append("]");
		return builder.toString();
	}
	
	
}
