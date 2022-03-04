package com.tablegame.model.bean.group;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;


@Entity
@Table(name = "participants")
@Component
public class ParticipantBean implements Serializable{
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private ParticipantBeanPK id;
	
	@ManyToOne
	@JoinColumn(name="groupId")
    @MapsId("groupId")
    private GroupBean group;
	
	@ManyToOne
	@JoinColumn(name="participantId")
	@MapsId("participantId")
	private UserBean participant;
	

	@Column(name = "participantNum")
	private int participantNum;
	
	
	@Column(name = "joinedTime") //java.util.Date;
	private Date joinedTime;
	
	

	public ParticipantBeanPK getId() {
		return id;
	}

	public void setId(ParticipantBeanPK id) {
		this.id = id;
	}

	public GroupBean getGroup() {
		return group;
	}

	public void setGroup(GroupBean group) {
		this.group = group;
	}

	public UserBean getParticipant() {
		return participant;
	}

	public void setParticipant(UserBean participant) {
		this.participant = participant;
	}

	public int getParticipantNum() {
		return participantNum;
	}

	public void setParticipantNum(int participantNum) {
		this.participantNum = participantNum;
	}

	public Date getJoinedTime() {
		return joinedTime;
	}

	public void setJoinedTime(Date joinedTime) {
		this.joinedTime = joinedTime;
	}

}
