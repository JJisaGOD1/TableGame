package com.tablegame.model.repository.groups;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tablegame.model.bean.group.GroupBean;
import com.tablegame.model.bean.group.ParticipantBean;
import com.tablegame.model.bean.group.ParticipantBeanPK;



public interface ParticipantRepository extends JpaRepository<ParticipantBean, ParticipantBeanPK> {

	@Transactional //加入此註釋才可同時刪除該團參加者和該團
	void deleteByGroup(GroupBean group);

	
	@Query(value = "SELECT participants.groupId,participantId,participantNum,joinedTime "
			+ "FROM participants CROSS JOIN groups "
			+ "WHERE groups.groupId=participants.groupId AND groups.gameDate=:gameDate AND participants.participantId=:participantId",
			nativeQuery = true)
	List<ParticipantBean> getOneJoinedNumByDate(@Param("participantId") int participantId,@Param("gameDate") String date);


//	ByOrderByJoinedTimeAsc
	List<ParticipantBean> getByGroup(GroupBean group);
	
	
	
	
}
