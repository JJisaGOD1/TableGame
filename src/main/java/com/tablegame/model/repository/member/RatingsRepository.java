package com.tablegame.model.repository.member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tablegame.model.bean.member.RatingsBean;

@Repository
public interface RatingsRepository extends JpaRepository<RatingsBean, Integer> {
	
}
