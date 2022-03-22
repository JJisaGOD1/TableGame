package com.tablegame.model.bean.member;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.tablegame.model.bean.comment.CommentsBean;
import com.tablegame.model.bean.group.GroupBean;
import com.tablegame.model.bean.group.ParticipantBean;

@Component
@Entity
@Table(name = "member")
public class MembersBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "customer_id")
	private Integer id;
	
	@Column(name = "customer_name")
	private String cusName;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "pwd")
	private String pwd;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "street")
	private String address;
	
//	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@Column(name = "birthday")
	private Date birthday;
	
	@DateTimeFormat(pattern = "yy/MM/dd HH:mm:ss")
	@Temporal(TemporalType.DATE)
	@Column(name = "created_time")
	private Date createdTime;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_rating_id")
	private RatingsBean ratingsBean;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "launcher")
	private Set<GroupBean> launchedGroups=new LinkedHashSet<GroupBean>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "participant")
	private Set<ParticipantBean> participantedGroups=new LinkedHashSet<ParticipantBean>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "membersBean",cascade = CascadeType.ALL)
	private Set<CommentsBean> comments=new LinkedHashSet<CommentsBean>();

	@Transient
	private Integer loginCount=0;
	
	@PrePersist
	public void onCreate() {
		if(createdTime == null) {
			createdTime = new Date();
		}
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public RatingsBean getRatingsBean() {
		return ratingsBean;
	}

	public void setRatingsBean(RatingsBean ratingsBean) {
		this.ratingsBean = ratingsBean;
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

	public Integer getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(Integer loginCount) {
		this.loginCount = loginCount;
	}

	

	
}
