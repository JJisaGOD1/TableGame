package com.tablegame.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.tablegame.model.bean.group.ParticipantBean;
import com.tablegame.model.bean.member.MembersBean;

public class ParticipantsDto {
	
	@JsonProperty(value = "participant")
	private ParticipantBean p;
	
	@JsonProperty(value = "member")
	private MembersBean m;
	
	public ParticipantsDto(ParticipantBean p, MembersBean m) {
		super();
		this.p = p;
		this.m = m;
	}
	
}
