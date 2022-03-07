package com.tablegame.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class googleLoginDto implements Serializable {
	private static final long serialVersionUID = 1L;

	@JsonProperty(value = "loginEmail")
	private String email;

	public googleLoginDto() {
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
