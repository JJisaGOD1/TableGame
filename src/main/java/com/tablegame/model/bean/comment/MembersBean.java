package com.tablegame.model.bean.comment;

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

@Entity
@Table(name = "member")
public class MembersBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "customer_id")
	private Integer id;
	
	@Column(name = "customer_name")
	private String cusName;
	
	@Column(name = "pwd")
	private String password;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "membersBean", cascade = CascadeType.ALL)
	private Set<CommentsBean> comments = new LinkedHashSet<CommentsBean>();
	
	public MembersBean() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<CommentsBean> getComments() {
		return comments;
	}

	public void setComments(Set<CommentsBean> comments) {
		this.comments = comments;
	}
	
}
