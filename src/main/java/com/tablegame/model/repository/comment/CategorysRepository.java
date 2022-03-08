package com.tablegame.model.repository.comment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tablegame.model.bean.comment.CategorysBean;

@Repository
public interface CategorysRepository extends JpaRepository<CategorysBean, Integer> {

}
