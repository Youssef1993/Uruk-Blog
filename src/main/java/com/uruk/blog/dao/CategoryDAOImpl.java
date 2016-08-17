package com.uruk.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.uruk.blog.beans.Category;

public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public boolean addCategory(String category) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Category getCategory(int id) {
		String query = "select * from Category where idCategory=?";
		Category category = jdbcTemplate.queryForObject(query,
				new RowMapper<Category>() {

					@Override
					public Category mapRow(ResultSet res, int rowNum)
							throws SQLException {
						Category temp = new Category();
						temp.setName(res.getString("name"));
						temp.setId(res.getInt("idCategory"));
						return temp;
					}

				}, id);

		return category;
	}

	@Override
	public Map<Integer, String> getAllCategorys() {
		String query = "select * from Category";
		Map<Integer, String> categoryList = new LinkedHashMap<Integer, String>();
		List<Map<String, Object>> results = jdbcTemplate.queryForList(query);
		for (Map<String, Object> line : results) {
			Category category = new Category();
			category.setId(Integer.parseInt(String.valueOf(line
					.get("idCategory"))));
			category.setName(String.valueOf(line.get("name")));
			categoryList.put(category.getId(), category.getName());
		}

		return categoryList;
	}
}
