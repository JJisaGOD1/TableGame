package com.tablegame.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.tablegame.model.bean.group.ParticipantBean;
import com.tablegame.model.bean.member.MembersBean;

public class ParticipantsDto {
	
	@JsonProperty(value = "participant")
	private ParticipantBean participant;
	
	@JsonProperty(value = "member")
	private MembersBean member;
	
	public ParticipantsDto(ParticipantBean participant, MembersBean member) {
		super();
		this.participant = participant;
		this.member = member;
	}
	
}
