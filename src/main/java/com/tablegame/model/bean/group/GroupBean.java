package com.tablegame.model.bean.group;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

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

import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.product.Product;

@Entity
@Table(name = "groups")
@Component
public class GroupBean implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "groupId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int groupId;
	
	
	@Column(name = "launcherId")
	@Transient
	private int launcherId;
	
	@Column(name = "productId")
	@Transient
	private int productId;
	
//	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")//給json看
	@DateTimeFormat(pattern = "yyyy/MM/dd") //給java看 jsp的EL
	@Temporal(TemporalType.TIMESTAMP)//給db看
	@Column(name = "gameDate")
	private Date gameDate; //java.util.Date;
	
	@Column(name = "introduction")
	private String introduction;

//	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")//給json看
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") //給java看 jsp的EL
	@Temporal(TemporalType.TIMESTAMP)//給db看
	@Column(name = "createdTime")
	private Date createdTime;
	
	@PrePersist // 當 Entity 狀態要變成 Persistent 前，做以下方法
	public void onCreate() {
		if(createdTime==null) {
			createdTime=new Date();
		}
	}
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "launcherId")
	private MembersBean launcher;
	
	@ManyToOne(fetch = FetchType.EAGER) //單向
	@JoinColumn(name = "productId")
	private Product product;
	
//	@ManyToOne(fetch = FetchType.EAGER) //單向
//	@JoinColumn(name = "daypartId")
//	private DaypartBean daypartId;
	
	
	
	
	//mappedBy是對方java類別(ParticipantBean)內，屬性為自身類別(GroupBean)的參用名。{即ParticipantBean內有屬性：GroupBean group}
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "group")//雙向  
	private List<ParticipantBean>  participants=new LinkedList<ParticipantBean>();

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public int getLauncherId() {
		return launcherId;
	}

	public void setLauncherId(int launcherId) {
		this.launcherId = launcherId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public Date getGameDate() {
		return gameDate;
	}

	public void setGameDate(Date gameDate) {
		this.gameDate = gameDate;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public MembersBean getLauncher() {
		return launcher;
	}

	public void setLauncher(MembersBean launcher) {
		this.launcher = launcher;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<ParticipantBean> getParticipants() {
		return participants;
	}

	public void setParticipants(List<ParticipantBean> participants) {
		this.participants = participants;
	}


	

		
}