package com.tablegame.model.repository.groups;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tablegame.model.bean.group.GroupBean;


public interface GroupsRepository extends JpaRepository<GroupBean, Integer> {

	public GroupBean findFirstByOrderByCreatedTimeDesc();

	public List<GroupBean> findByGameDate(Date gameDate);

	
}
