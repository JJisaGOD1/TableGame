package com.tablegame.service.comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.comment.CategorysBean;
import com.tablegame.model.bean.comment.CommentsBean;
import com.tablegame.model.bean.comment.ConditionsBean;
import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.product.Product;
import com.tablegame.model.repository.comment.CategorysRepository;
import com.tablegame.model.repository.comment.CommentsRepository;
import com.tablegame.model.repository.comment.ConditionsRepository;
import com.tablegame.model.repository.member.MembersRepository;
import com.tablegame.model.repository.product.ProductRepository;

@Service
public class CommentsService {

	@Autowired
	private CommentsRepository comDao;

	@Autowired
	private CategorysRepository cateDao;

	@Autowired
	private ConditionsRepository condDao;

	@Autowired
	private ProductRepository proDao;

	@Autowired
	private MembersRepository memDao;

	public CommentsBean insertCommentHasProduct(CommentsBean comment, Integer product, String name) {
		Product proBean = getProductById(product);
		Integer count = proBean.getProblem_count();
		proBean.setProblem_count(count + 1);
		Optional<MembersBean> option = memDao.findByCusName(name);
		MembersBean member = option.get();

		comment.setMembersBean(member);
		comment.setProductsBean(proBean);
		CommentsBean res = comDao.save(comment);
		return res;
	}

	public CommentsBean insertComment(CommentsBean comment, String name) {

		Optional<MembersBean> option = memDao.findByCusName(name);
		MembersBean member = option.get();
		comment.setMembersBean(member);
		CommentsBean res = comDao.save(comment);
		return res;
	}

	public CommentsBean findById(Integer id) {
		Optional<CommentsBean> option = comDao.findById(id);
		if (option.isPresent()) {
			CommentsBean res = option.get();
			return res;
		}
		return null;
	}

	public List<CommentsBean> findAllComments() {
		List<CommentsBean> res = comDao.findAll();
		return res;
	}

	public Page<CommentsBean> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 6, Sort.Direction.DESC, "createdTime");
		Page<CommentsBean> res = comDao.findAll(pgb);
		return res;
	}

	public void deleteById(Integer id) {
		comDao.deleteById(id);
	}

	public ConditionsBean getConditionById(Integer id) {
		Optional<ConditionsBean> option = condDao.findById(id);
		if (option.isPresent()) {
			return option.get();
		}
		return null;
	}

	public CategorysBean getCategoryById(Integer id) {
		Optional<CategorysBean> option = cateDao.findById(id);
		if (option.isPresent()) {
			return option.get();
		}
		return null;
	}

	public List<CategorysBean> getCategoryList() {
		List<CategorysBean> res = cateDao.findAll();
		return res;
	}

	public List<ConditionsBean> getConditionList() {
		List<ConditionsBean> res = condDao.findAll();
		return res;
	}

	public ConditionsBean getFirstCondition() {
		Optional<ConditionsBean> option = condDao.findById(1);
		return option.get();
	}

	public List<Product> getProductList() {
		List<Product> res = proDao.findAll();
		return res;
	}

	public Product getProductById(Integer id) {
		Optional<Product> option = proDao.findById(id);
		if (option.isPresent()) {
			return option.get();
		}
		return null;
	}

	public Integer findMemberIdByName(String name) {
		Optional<MembersBean> option = memDao.findByCusName(name);
		Integer memberId = option.get().getId();
		return memberId;
	}

	public Page<CommentsBean> findByMembersId(Integer memberId, Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 3, Sort.Direction.DESC, "created_time");
		Page<CommentsBean> comments = comDao.findByMembersId(memberId, pgb);
		return comments;
	}

	public Page<CommentsBean> findByConditionsId(Integer conditionId, Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "created_time");
		Page<CommentsBean> comments = comDao.findByConditionsId(conditionId, pgb);
		return comments;
	}

	public LinkedHashMap<String, Integer> findByCategorysId() {
		Map<Integer, String> findCate = new LinkedHashMap<Integer, String>();
		LinkedHashMap<String, Integer> categoryMap = new LinkedHashMap<String, Integer>();
		List<CategorysBean> list = cateDao.findAll();

		int first_count = 0;
		for (CategorysBean cate : list) {
			findCate.put(cate.getId(), cate.getCateName());
		}
		for (int i = 1; i <= 6; i++) {
			List<CommentsBean> res = comDao.findByCategorysId(i);
			if (res.size() != 0) {
				categoryMap.put(findCate.get(i), res.size());
			} else {
				categoryMap.put(findCate.get(i), first_count);
			}
		}
		return categoryMap;
	}

	public List<HashMap<String, Object>> findByCategoryMap() {
		Map<Integer, String> findCate = new LinkedHashMap<Integer, String>();

		List<CategorysBean> list = cateDao.findAll();

		List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();

		int first_count = 0;
		for (CategorysBean cate : list) {
			findCate.put(cate.getId(), cate.getCateName());
		}
		for (int i = 1; i <= 6; i++) {
			List<CommentsBean> res = comDao.findByCategorysId(i);
			if (res.size() != 0) {
				HashMap<String, Object> categoryMap = new HashMap<String, Object>();
				categoryMap.put("name", findCate.get(i));
				categoryMap.put("value", String.valueOf(res.size()));
				mapList.add(categoryMap);
			} else {
				HashMap<String, Object> categoryMap = new HashMap<String, Object>();
				categoryMap.put("name", findCate.get(i));
				categoryMap.put("value", first_count);
				mapList.add(categoryMap);
			}
		}
		return mapList;
	}

	public List<String> getCategorysName() {
		ArrayList<String> categoryName = new ArrayList<String>();
		List<CategorysBean> cateList = cateDao.findAll();
		for (CategorysBean cate : cateList) {
			categoryName.add(cate.getCateName());
		}
		return categoryName;
	}
	
}
