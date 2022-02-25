package com.tablegame.model.group;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "products")
@Component
public class ProductBean implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "productId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	
	@Column(name = "productName")
	private String productName;
	
	@Column(name = "gameType")
	private String gameType;
	
	@Column(name = "price")
	private int price;
	
	@Column(name = "minPlayers")
	private int minPlayers;
	
	@Column(name = "maxPlayers")
	private int maxPlayers;
	
	@Column(name = "lowestAge")
	private int lowestAge;
	
	//////////////////////

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getGameType() {
		return gameType;
	}

	public void setGameType(String gameType) {
		this.gameType = gameType;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMinPlayers() {
		return minPlayers;
	}

	public void setMinPlayers(int minPlayers) {
		this.minPlayers = minPlayers;
	}

	public int getMaxPlayers() {
		return maxPlayers;
	}

	public void setMaxPlayers(int maxPlayers) {
		this.maxPlayers = maxPlayers;
	}

	public int getLowestAge() {
		return lowestAge;
	}

	public void setLowestAge(int lowestAge) {
		this.lowestAge = lowestAge;
	}
	
	
	
}
