package com.tablegame.model.bean.group;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Embeddable
public class ParticipantBeanPK implements Serializable{
	private static final long serialVersionUID = 1L;

	
	private int groupId;
	
	
	private int participantId;
	
	public ParticipantBeanPK() {}
	
	public ParticipantBeanPK(int groupId, int participantId) {
		super();
		this.groupId = groupId;
		this.participantId = participantId;
	}

	

	public int getGroupId() {
		return groupId;
	}


	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}


	public int getParticipantId() {
		return participantId;
	}


	public void setParticipantId(int participantId) {
		this.participantId = participantId;
	}


	@Override
	public int hashCode() {
		return Objects.hash(groupId, participantId);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ParticipantBeanPK other = (ParticipantBeanPK) obj;
		return groupId == other.groupId && participantId == other.participantId;
	}

	

}
