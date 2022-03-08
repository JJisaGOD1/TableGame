package com.tablegame.model.repository.groups;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tablegame.model.bean.group.GroupBean;


public interface GroupsRepository extends JpaRepository<GroupBean, Integer> {

	public GroupBean findFirstByOrderByCreatedTimeDesc();

	
//	未知原因無法從db抓取到List
//	public List<GroupBean> findByGameDate(Date gameDate);
//	
//	public List<GroupBean> getByGameDate(Date gameDate);
	
	@Query(value = "SELECT * FROM groups WHERE gameDate=:gameDate",nativeQuery = true)
	public List<GroupBean> getByGameDate2(@Param(value = "gameDate") String gameDate);
	
	
	
	
}
