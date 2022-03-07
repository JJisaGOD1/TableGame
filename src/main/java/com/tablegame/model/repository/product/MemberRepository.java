package com.tablegame.model.repository.product;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tablegame.model.bean.member.MembersBean;



public interface MemberRepository extends JpaRepository<MembersBean, Integer> {

	@Query(value = "select * from Member where customer_name = :customer_name", nativeQuery = true)
	public MembersBean findByName(@Param(value = "customer_name") String name);
}
