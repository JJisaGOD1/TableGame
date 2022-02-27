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

import com.tablegame.model.bean.member.Member;

@Entity
@Table(name = "Orders")
public class Orders {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private Integer orderId;

	private Date order_date;

	private String Processingstatus;

	private Integer totalprice;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer_id")
	private Member member;

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

	public Integer getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Integer totalprice) {
		this.totalprice = totalprice;
	}

}
