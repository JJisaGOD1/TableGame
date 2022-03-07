package com.tablegame.model.bean.product;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.tablegame.model.bean.member.MembersBean;

@Entity
@Table(name = "Orders")
public class Orders {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private Integer orderId;

	@JsonFormat(pattern = "yyyy/MM/dd HH.mm.ss.SS", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "order_date")
	private Date order_date;

	private String Processingstatus;

	private Double totalprice;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer_id")
	private MembersBean member;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orders", cascade = CascadeType.ALL)
	private Set<OrderList> orderlist = new LinkedHashSet<OrderList>();

	public Integer getOrderId() {
		return orderId;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getProcessingstatus() {
		return Processingstatus;
	}

	public void setProcessingstatus(String processingstatus) {
		Processingstatus = processingstatus;
	}

	public Double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Double totalprice) {
		this.totalprice = totalprice;
	}

	public MembersBean getMember() {
		return member;
	}

	public void setMember(MembersBean member) {
		this.member = member;
	}

	public Set<OrderList> getOrderList() {
		return orderlist;
	}

	public void setOrderList(Set<OrderList> orderList) {
		this.orderlist = orderList;
	}

}
