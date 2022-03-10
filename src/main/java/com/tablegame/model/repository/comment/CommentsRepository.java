package com.tablegame.model.repository.comment;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tablegame.model.bean.comment.CommentsBean;


@Repository
public interface CommentsRepository extends JpaRepository<CommentsBean, Integer> {
			
	@Query(value = "select * from opinion where fk_member_id = :memberId", nativeQuery = true)
	public Page<CommentsBean> findByMembersId(@Param(value = "memberId") Integer memberId, Pageable pgb);
	
	@Query(value = "select * from opinion where fk_condition_id = :conditionId", nativeQuery = true)
	public Page<CommentsBean> findByConditionsId(@Param(value = "conditionId") Integer conditionId, Pageable pgb);
	
	@Query(value = "select * from opinion where fk_category_id = :categoryId", nativeQuery = true)
	public List<CommentsBean> findByCategorysId(@Param(value = "categoryId") Integer categoryId);

}
