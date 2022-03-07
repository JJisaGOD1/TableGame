package com.tablegame.service.product;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.repository.product.MemberRepository;

@Service
public class ProductMemberService {

	@Autowired
	private MemberRepository dao;

	public void insert(MembersBean member) {
		dao.save(member);
	}

	public MembersBean findByName(String name) {
		MembersBean member = dao.findByName(name);

		if (member != null) {
			return member;
		}

		return null;
	}

}