package com.tablegame.service.meals;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.meals.FoodList;
import com.tablegame.model.bean.meals.FoodListRepository;

@Service
public class FoodListService {

	@Autowired
	private FoodListRepository dao;

	public void insert(FoodList foodList) {
		dao.save(foodList);
	}

//	public void insert2(String foodName,Integer foodPrice,String foodType,String foodImage) {
//		dao.save(foodName,foodPrice,foodType,foodImage);
//	}

	public void delete(Integer foodId) {
		dao.deleteById(foodId);
	}

	public FoodList findById(Integer id) {
		Optional<FoodList> op = dao.findById(id);

		if (op.isPresent()) {
			return op.get();
		}

		return null;
	}

	public List<FoodList> findAllFood() {
		List<FoodList> messages = dao.findAll();

		return messages;
	}

	public Page<FoodList> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.ASC, "foodId");

		return dao.findAll(pgb);
	}

	public Page<FoodList> findByPageMenu(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 12, Sort.Direction.ASC, "foodId");

		return dao.findAll(pgb);
	}



}
