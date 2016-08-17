package com.uruk.blog.dao;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.uruk.blog.service.PostService;
import com.uruk.blog.service.PostServiceImpl;
import com.uruk.blog.service.UserService;
import com.uruk.blog.service.UserServiceImpl;

/**
 * 
 * @author youssef abidi
 *
 */

@EnableWebMvc
@Configuration
public class BlogConfiguration {

	@Bean
	public DataSource dataSource() throws Exception {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("org.mariadb.jdbc.Driver");
		dataSource.setUrl("jdbc:mariadb://localhost:3306/Blog");
		dataSource.setUsername("root");
		dataSource.setPassword("youssef93");
		dataSource.setMinIdle(5);
		dataSource.setMaxIdle(20);
		dataSource.setMaxOpenPreparedStatements(180);
		return dataSource;
	}

	@Bean
	public JdbcTemplate jdbcTemplate() throws Exception {
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSource());
		return jdbcTemplate;
	}

	@Bean
	public UserDAO userDao() throws Exception {
		UserDAOImpl accountDao = new UserDAOImpl();

		return accountDao;
	}

	@Bean
	public UserService userService() throws Exception {
		UserServiceImpl userService = new UserServiceImpl();

		return userService;
	}

	@Bean
	public PostDAO postDao() throws Exception {
		PostDAOImpl postDao = new PostDAOImpl();

		return postDao;
	}

	@Bean
	public PostService postService() throws Exception {
		PostServiceImpl postService = new PostServiceImpl();

		return postService;
	}

	@Bean
	public CategoryDAO categoryDao() {
		return new CategoryDAOImpl();
	}

}
