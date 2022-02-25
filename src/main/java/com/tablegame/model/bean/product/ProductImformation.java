package com.tablegame.model.bean.product;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

@SuppressWarnings("serial")
@Entity
@Table(name = "Product_information")
public class ProductImformation implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "productinformation_id")
	private Integer productinformationId;

	@Column(name = "productid_id")
	private Integer productid_id;

	private Integer stock;

	@JsonFormat(pattern = "yyyy/MM/dd HH.mm.ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	private Date changedate;

	private String history;

	@PrePersist
	public void onCreate() {
		if (changedate == null) {
			changedate = new Date();
		}
	}

	public Integer getProductinformationId() {
		return productinformationId;
	}

	public void setProductinformationId(Integer productinformationId) {
		this.productinformationId = productinformationId;
	}

	public Integer getProductid_id() {
		return productid_id;
	}

	public void setProductid_id(Integer productid_id) {
		this.productid_id = productid_id;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Date getChangedate() {
		return changedate;
	}

	public void setChangedate(Date changedate) {
		this.changedate = changedate;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}

}
