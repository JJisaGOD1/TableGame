package com.tablegame.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;


public class BookingDto implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@JsonProperty(value = "date") //客製化key的值
	private String date;
	
	@JsonProperty(value = "period")
	private String period;
	

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	
	
	
	
}
