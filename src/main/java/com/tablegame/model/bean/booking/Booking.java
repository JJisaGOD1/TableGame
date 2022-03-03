package com.example.booking.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "booking")
@Component
public class Booking implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "several")
	private Integer several;
	
	
	@Column(name = "reservation_date")
	private Date reservation_date;

	@Column(name = "number")
	private Integer number;

	@Column(name = "remark")
	private String remark;

	@Column(name = "period")
	private String period;

	@Transient
	@Column(name = "logins_id")
	private Integer loginId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "logins_id")
	private Login user;

//	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss EEEE")
//	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
//	@Temporal(TemporalType.TIMESTAMP)
	private Date added;
//	
	@PrePersist // 當 Entity 狀態要變成 Persistent 的時候，做以下方法
	public void onCreate() {
	if(added == null) {
			added = new Date();
		}
	}

	public int getLoginId() {
		return loginId;
	}

	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}

	public String getPeriod() {
		return period;
	}

	public Login getUser() {
		return user;
	}

	public void setUser(Login user) {
		this.user = user;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
//
//	public Date getAdded() {
//		return added;
//	}
//
//	public void setAdded(Date added) {
//		this.added = added;
//	}

	public Booking() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSeveral() {
		return several;
	}

	public void setSeveral(Integer several) {
		this.several = several;
	}

	public Date getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(Date reservation_date) {
		this.reservation_date = reservation_date;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("booking [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(", several=");
		builder.append(several);
		builder.append(", reservation_date=");
		builder.append(reservation_date);
		builder.append(", number=");
		builder.append(number);
		builder.append(", remark=");
		builder.append(remark);
//		builder.append(", added=");
//		builder.append(added);
		builder.append("]");
		return builder.toString();
	}

}
