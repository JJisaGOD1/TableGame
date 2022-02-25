package com.tablegame.model.group;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "users")
@Component
public class UserBean implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id 
	@Column(name = "userid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	
	@Column(name = "username")
	private String username;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "launcher",cascade = CascadeType.ALL)
	private Set<GroupBean> launchedGroups=new LinkedHashSet<GroupBean>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "participant",cascade = CascadeType.ALL)
	private Set<ParticipantBean> participantedGroups=new LinkedHashSet<ParticipantBean>();

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Set<GroupBean> getLaunchedGroups() {
		return launchedGroups;
	}

	public void setLaunchedGroups(Set<GroupBean> launchedGroups) {
		this.launchedGroups = launchedGroups;
	}

	public Set<ParticipantBean> getParticipantedGroups() {
		return participantedGroups;
	}

	public void setParticipantedGroups(Set<ParticipantBean> participantedGroups) {
		this.participantedGroups = participantedGroups;
	}
	
	
	
	
	
}
