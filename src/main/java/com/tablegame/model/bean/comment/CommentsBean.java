package com.tablegame.model.bean.comment;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.product.Product;

@Entity
@Table(name = "opinion")
public class CommentsBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comment_id")
	private Integer id;
	
	@Column(name = "comment")
	private String comment;
	
	@Column(name = "response")
	private String response;
	
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss",timezone = "GMT+8")
	@DateTimeFormat(pattern = "yy/MM/dd HH:mm:ss")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_time")
	private Date createdTime;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_member_id")
	private MembersBean membersBean;
	
	
	@OneToOne     //要同時對資料庫作關係才寫Cascade  refresh:Query使用時為確保拿到最新資料從DB在撈一次 Merge:寫回資料庫之更新
	@JoinColumn(name = "fk_category_id")
	private CategorysBean categorysBean;
	
	@OneToOne
	@JoinColumn(name = "fk_condition_id")
	private ConditionsBean conditionsBean;
	
	@OneToOne
	@JoinColumn(name = "fk_product_id")
	private Product productsBean;
	
	public CommentsBean() {
	}
	
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

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public MembersBean getMembersBean() {
		return membersBean;
	}

	public void setMembersBean(MembersBean membersBean) {
		this.membersBean = membersBean;
	}

	public CategorysBean getCategorysBean() {
		return categorysBean;
	}

	public void setCategorysBean(CategorysBean categorysBean) {
		this.categorysBean = categorysBean;
	}

	public ConditionsBean getConditionsBean() {
		return conditionsBean;
	}

	public void setConditionsBean(ConditionsBean conditionsBean) {
		this.conditionsBean = conditionsBean;
	}

	public Product getProductsBean() {
		return productsBean;
	}

	public void setProductsBean(Product productsBean) {
		this.productsBean = productsBean;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CommentsBean [id=");
		builder.append(id);
		builder.append(", comment=");
		builder.append(comment);
		builder.append(", response=");
		builder.append(response);
		builder.append(", createdTime=");
		builder.append(createdTime);
		builder.append(", membersBean=");
		builder.append(membersBean);
		builder.append(", categorysBean=");
		builder.append(categorysBean);
		builder.append(", conditionsBean=");
		builder.append(conditionsBean);
		builder.append(", productsBean=");
		builder.append(productsBean);
		builder.append("]");
		return builder.toString();
	}

	
}
