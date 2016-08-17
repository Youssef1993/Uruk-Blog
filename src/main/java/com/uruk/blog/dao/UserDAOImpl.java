package com.uruk.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.uruk.blog.beans.User;

public class UserDAOImpl implements UserDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public boolean subscribe(User user) {
		String query = "insert into User (first_name,last_name,email,country,username,password) values(?,?,?,?,?,?)";
		Object[] queryArgs = { user.getFirstName(), user.getLastName(),
				user.getEmail(), user.getCountry(), user.getUserName(),
				user.getPassword() };
		int result = jdbcTemplate.update(query, queryArgs);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public User getUserInfo(int id) {
		String query = "select * from User where idUser=?";
		User user = jdbcTemplate.queryForObject(query, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet res, int rowNum) {
				User user = new User();
				try {
					user.setId(res.getInt(1));
					user.setFirstName(res.getString(2));
					user.setLastName(res.getString(3));
					user.setEmail(res.getString(4));
					user.setCountry(res.getString(5));
					user.setPicture(res.getString(6));
					user.setUserName(res.getString(7));
					user.setRole(res.getString(9));
					return user;
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
				return user;
			}

		}, id);
		return user;
	}

	@Override
	public boolean updateUserInfo(User user) {

		return false;
	}

	@Override
	public boolean upadatePicture(int id, String picture) {

		String query = "update User set picture=? where idUser=?";
		Object[] queryArgs = { picture, id };
		int res = jdbcTemplate.update(query, queryArgs);
		if (res > 0) {
			return true;
		}
		return false;
	}

	public User authentificateUser(String login) {
		String query = "select idUser,password,role from User where username=? or email=?";
		Object[] queryArgs = { login, login };
		User user = new User();
		try {
			user = jdbcTemplate.queryForObject(query, new RowMapper<User>() {

				@Override
				public User mapRow(ResultSet res, int rowNum)
						throws SQLException {

					User temp = new User();
					temp.setId(res.getInt("idUser"));
					temp.setRole(res.getString(("role")));
					temp.setPassword(res.getString("password"));

					return temp;
				}

			}, queryArgs);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return user;
	}

	@Override
	public int getUserId(String username) {
		String query = "select idUser from User where username=?";
		int id = jdbcTemplate.queryForObject(query, new RowMapper<Integer>() {

			@Override
			public Integer mapRow(ResultSet res, int rowNum)
					throws SQLException {
				int temp = res.getInt("idUser");
				return temp;
			}

		}, username);
		return id;
	}

}
