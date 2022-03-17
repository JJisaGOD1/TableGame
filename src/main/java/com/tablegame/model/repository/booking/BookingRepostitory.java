package com.tablegame.model.repository.booking;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tablegame.model.bean.booking.Booking;
import com.tablegame.model.bean.member.MembersBean;



public interface BookingRepostitory extends JpaRepository<Booking, Integer> {

	@Query(value = "select * from booking where member_customer_id = :name ", nativeQuery = true)
	public List<Booking> findByLoginId(@Param(value = "name") Integer member_customer_Id);
	
	@Query(value = "select number from booking where reservation_date=:reservation_date and [period]=:period", nativeQuery = true)
	public List<Booking> findBytime(@Param(value = "reservation_date")String reservation_date ,@Param(value = "period") String period);

	



}


