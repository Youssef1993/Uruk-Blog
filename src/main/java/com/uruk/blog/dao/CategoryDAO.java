package com.uruk.blog.dao;

import java.util.Map;

import com.uruk.blog.beans.Category;

public interface CategoryDAO {

	public boolean addCategory(String category);

	public Category getCategory(int id);

	public Map<Integer, String> getAllCategorys();

}
