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

@SuppressWarnings("serial")
@Entity
@Table(name = "Product")
public class Product implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private Integer productId;

	@Column(name = "product_name")
	private String productName;

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

//	@JsonManagedReference
//	@OneToMany(cascade = CascadeType.REMOVE)
//	@JoinColumn(name = "productid_id")
//	private Set<ProductImformation> PIBeans;

	@Min(value = 0, message = "庫存不可小於0")
	private Integer Stock;

	private String productintroduce;

	private Integer problem_count;

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

	@Transient
	private MultipartFile photo;

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "product")
	private Set<ProductOrderList> orderList = new LinkedHashSet<ProductOrderList>();

	public Product() {

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

	public void setProduct_id(Integer product_id) {
		this.productId = product_id;
	}

	public String getProduct_name() {
		return productName;
	}

	public void setProduct_name(String productName) {
		this.productName = productName;
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

}
