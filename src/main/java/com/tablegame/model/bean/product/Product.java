package com.tablegame.model.bean.product;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.servlet.MultipartConfigElement;
import javax.validation.constraints.Min;

import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "Product")
public class Product implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private Integer productId;

	private String product_name;

	@Min(value = 0, message = "價錢不可小於0")
	private Double price;

	private String gametype;

	@Min(value = 1, message = "最小人數不可小於1")
	private Integer minplayer;

	@Min(value = 1, message = "最大人數不可小於1")
	private Integer maxplayer;

	@Min(value = 1, message = "最小年齡不可小於1")
	private Integer low_age;

	private String photourl;

	private String sellstatus;

	@Min(value = 0, message = "庫存不可小於0")
	private Integer Stock;

	private String productintroduce;

	private Integer problem_count;

	@Transient
	private MultipartFile photo;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product", cascade = CascadeType.ALL)
	private Set<OrderList> orderlist = new LinkedHashSet<OrderList>();

	public Product() {

	}

	public Product(Integer productId, String product_name, @Min(value = 0, message = "價錢不可小於0") Double price,
			String gametype, @Min(value = 1, message = "最小人數不可小於1") Integer minplayer,
			@Min(value = 1, message = "最大人數不可小於1") Integer maxplayer,
			@Min(value = 1, message = "最小年齡不可小於1") Integer low_age, String photourl, String sellstatus) {
		super();
		this.productId = productId;
		this.product_name = product_name;
		this.price = price;
		this.gametype = gametype;
		this.minplayer = minplayer;
		this.maxplayer = maxplayer;
		this.low_age = low_age;
		this.photourl = photourl;
		this.sellstatus = sellstatus;
	}

	public Integer getStock() {
		return Stock;
	}

	public void setStock(Integer stock) {
		Stock = stock;
	}

	public Integer getProduct_id() {
		return productId;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getGametype() {
		return gametype;
	}

	public void setGametype(String gametype) {
		this.gametype = gametype;
	}

	public Integer getMinplayer() {
		return minplayer;
	}

	public void setMinplayer(Integer minplayer) {
		this.minplayer = minplayer;
	}

	public Integer getMaxplayer() {
		return maxplayer;
	}

	public void setMaxplayer(Integer maxplayer) {
		this.maxplayer = maxplayer;
	}

	public Integer getLow_age() {
		return low_age;
	}

	public void setLow_age(Integer low_age) {
		this.low_age = low_age;
	}

	public String getPhotourl() {
		return photourl;
	}

	public void setPhotourl(String photourl) {
		this.photourl = photourl;
	}

	public String getSellstatus() {
		return sellstatus;
	}

	public void setSellstatus(String sellstatus) {
		this.sellstatus = sellstatus;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public String getProductintroduce() {
		return productintroduce;
	}

	public void setProductintroduce(String productintroduce) {
		this.productintroduce = productintroduce;
	}

	public Integer getProblem_count() {
		return problem_count;
	}

	public void setProblem_count(Integer problem_count) {
		this.problem_count = problem_count;
	}

}
