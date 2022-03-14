package com.tablegame.model.repository.member;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tablegame.model.bean.member.MembersBean;

@Repository
public interface MembersRepository extends JpaRepository<MembersBean, Integer> {
	
	public Optional<MembersBean> findByEmail(String email);
	
	@Query(value = "select * from member where fk_rating_id = :rating1 or fk_rating_id = :rating2", nativeQuery = true)
	public Page<MembersBean> findByRatingMember(@Param(value = "rating1" ) Integer rating1, 
			@Param(value = "rating2" ) Integer rating2, Pageable pgb);
	
	@Query(value = "select * from member where fk_rating_id = :rating3", nativeQuery = true)
	public Page<MembersBean> findByRatingCustomer(@Param(value = "rating3" ) Integer rating3, Pageable pgb);
	
	public Optional<MembersBean> findByCusName(String name);
	
	
	@Query(value="select * from Member where email=:email",nativeQuery = true)
	public MembersBean findByMail(@Param(value="email")String email);

	@Query(value="select * from Member ",nativeQuery = true)
	public MembersBean findAllMember(@Param(value="email")String email);
}
