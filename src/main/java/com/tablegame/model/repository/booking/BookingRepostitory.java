package com.tablegame.model.repository.booking;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tablegame.model.bean.booking.Booking;



public interface BookingRepostitory extends JpaRepository<Booking, Integer> {

	@Query(value = "select * from booking where member_customer_id = :name ", nativeQuery = true)
	public List<Booking> findByLoginId(@Param(value = "name") Integer member_customer_Id);

}
