package com.tablegame.model.bean.product;

import java.util.HashMap;
import java.util.List;

/*
 * 將返回的資料項封裝為pojo物件的屬性
 */
public class Item {

	private List<String> title;
	private List<HashMap<String, Object>> number;

	public List<String> getTitle() {
		return title;
	}

	public void setTitle(List<String> title) {
		this.title = title;
	}

	public List<HashMap<String, Object>> getNumber() {
		return number;
	}

	public void setNumber(List<HashMap<String, Object>> number) {
		this.number = number;
	}

}