package com.tablegame.dto;

import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ChangeTheGroupInfoDto {

	@JsonProperty(value = "groupId")
	private int groupId;
	
	@JsonProperty(value = "prodId")
	private int prodId;
	
	@JsonProperty(value = "numOfparticipants")
	private HashMap<Integer, Integer> numOfparticipants;

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public int getProdId() {
		return prodId;
	}

	public void setProdId(int prodId) {
		this.prodId = prodId;
	}

	public HashMap<Integer, Integer> getNumOfparticipants() {
		return numOfparticipants;
	}

	public void setNumOfparticipants(HashMap<Integer, Integer> numOfparticipants) {
		this.numOfparticipants = numOfparticipants;
	}
	
	

}
