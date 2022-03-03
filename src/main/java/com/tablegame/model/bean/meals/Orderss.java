package com.tablegame.model.bean.meals;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
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


@Entity
@Table(name = "Orderss")
public class Orderss {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private Integer orderId;
	
	@Column(name = "table_num")
	private String tableNum;
	
	@Min(value = 1, message = "人數下限為1人")
    @Max(value = 12, message = "人數上限為12人")
	@Column(name = "people_num")
	private Integer peopleNum;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
//	@Temporal(TemporalType.TIME)
	@Column(name = "order_date")
	private Date orderDate;
	
	@Column(name = "process_state")
	private String processState;
	
	@Column(name = "payment_state")
	private String paymentState;
	
	@OneToMany(mappedBy = "orders") 
    private Set<MealList> mealList;
	
	
	public Orderss() {
	}

	@PrePersist // 當 Entity 狀態要變成 Persistent 的時候，做以下方法
	public void onCreate() {
		if (orderDate == null) {
			orderDate = new Date();
		}
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getTableNum() {
		return tableNum;
	}

	public void setTableNum(String tableNum) {
		this.tableNum = tableNum;
	}

	public Integer getPeopleNum() {
		return peopleNum;
	}

	public void setPeopleNum(Integer peopleNum) {
		this.peopleNum = peopleNum;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getProcessState() {
		return processState;
	}

	public void setProcessState(String processState) {
		this.processState = processState;
	}

	public String getPaymentState() {
		return paymentState;
	}

	public void setPaymentState(String paymentState) {
		this.paymentState = paymentState;
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
		builder.append("Orders [orderId=");
		builder.append(orderId);
		builder.append(", tableNum=");
		builder.append(tableNum);
		builder.append(", peopleNum=");
		builder.append(peopleNum);
		builder.append(", orderDate=");
		builder.append(orderDate);
		builder.append(", processState=");
		builder.append(processState);
		builder.append(", paymentState=");
		builder.append(paymentState);
		builder.append(", mealList=");
		builder.append(mealList);
		builder.append("]");
		return builder.toString();
	}

	
	//

}
