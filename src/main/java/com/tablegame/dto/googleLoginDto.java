package com.tablegame.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class googleLoginDto implements Serializable {
	private static final long serialVersionUID = 1L;

	@JsonProperty(value = "loginEmail")
	private String email;
	
	@JsonProperty(value = "userName")
	private String name;

	public googleLoginDto() {
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
