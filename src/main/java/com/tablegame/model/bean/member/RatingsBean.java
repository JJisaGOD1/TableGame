package com.tablegame.model.bean.member;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "rating")
public class RatingsBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rating_id")
	private Integer id;
	
	@Column(name = "rating_name")
	private String rateName;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "ratingsBean")
	private Set<MembersBean> membersBean =  new LinkedHashSet<MembersBean>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRateName() {
		return rateName;
	}

	public void setRateName(String rateName) {
		this.rateName = rateName;
	}

	public Set<MembersBean> getMembersBean() {
		return membersBean;
	}

	public void setMembersBean(Set<MembersBean> membersBean) {
		this.membersBean = membersBean;
	}
	
}
