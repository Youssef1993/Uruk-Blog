package com.uruk.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.uruk.blog.beans.Post;
import com.uruk.blog.exception.PostNotFoundException;

public class PostDAOImpl implements PostDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public boolean addPost(Post post) {
		String query = "insert into Post (idUser,title,link,content,date,category,image) Values(?,?,?,?,now(),?,?)";
		Object[] queryArgs = { post.getIdUser(), post.getTitle(),
				post.getLink(), post.getContent(), post.getCategory(),
				post.getImageName() };

		int result = jdbcTemplate.update(query, queryArgs);
		if (result > 0) {
			addTags(post);
			return true;

		}

		return false;

	}

	@Override
	public boolean modifyPost(Post post) {

		String query = "update Post set title=?,link=? , content=? , category=? where idPost=? and idUser=?";
		Object[] queryArgs = { post.getTitle(), post.getLink(),
				post.getContent(), post.getCategory(), post.getId(),
				post.getIdUser() };
		int res = jdbcTemplate.update(query, queryArgs);
		if (res > 0)
			return true;
		return false;
	}

	@Override
	public boolean deletePost(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Post getPost(String link) {

		String query = "select * from Post where link = ?";
		try {
			Post post = jdbcTemplate.queryForObject(query,
					new RowMapper<Post>() {

						@Override
						public Post mapRow(ResultSet res, int rowNum)
								throws SQLException {
							Post temp = new Post();
							temp.setId(res.getInt("idPost"));
							temp.setIdUser(res.getInt("iduser"));
							temp.setTitle(res.getString("title"));
							temp.setContent(res.getString("content"));
							temp.setNbViews(res.getInt("nb_views"));
							temp.setDate(res.getDate("date"));
							temp.setImageName(res.getString("image"));
							temp.setCategory(res.getInt("category"));

							return temp;
						}

					}, link);
			post.setTags(getAllTags(post.getId()));
			return post;
		} catch (DataAccessException e) {
			System.out.println(e.getMessage());
			throw new PostNotFoundException();
		}

	}

	@Override
	public List<Post> getUserPost(int idUser) {
		String query = "select * from Post where idUser = ?";
		List<Post> postList = new ArrayList<Post>();
		List<Map<String, Object>> result = jdbcTemplate.queryForList(query,
				idUser);
		for (Map<String, Object> line : result) {
			Post post = new Post();
			post.setId(Integer.parseInt(String.valueOf(line.get("idPost"))));
			post.setTitle(String.valueOf(line.get("title")));
			post.setNbViews(Integer.parseInt(String.valueOf(line
					.get("nb_views"))));
			post.setImageName(String.valueOf(line.get("image")));
			post.setDate((Date) line.get("date"));
			post.setContent((String.valueOf(line.get("content"))).substring(0,
					100) + "...");
			post.setLink((String) line.get("link"));
			postList.add(post);

		}

		return postList;
	}

	@Override
	public List<Post> getLastThreePosts() {
		String query = "select * from Post order by date DESC LIMIT 3";
		List<Post> postList = new ArrayList<Post>();
		List<Map<String, Object>> result = jdbcTemplate.queryForList(query);
		for (Map<String, Object> line : result) {
			Post post = new Post();
			post.setId(Integer.parseInt(String.valueOf(line.get("idPost"))));
			post.setTitle(String.valueOf(line.get("title")));
			post.setNbViews(Integer.parseInt(String.valueOf(line
					.get("nb_views"))));
			post.setImageName(String.valueOf(line.get("image")));
			post.setDate((Date) line.get("date"));
			post.setContent((String.valueOf(line.get("content"))).substring(0,
					100) + "...");
			post.setLink((String) line.get("link"));
			postList.add(post);
		}
		return postList;
	}

	@Override
	public List<Post> getPage(int begin, int end) {
		List<Post> posts = new ArrayList<Post>();
		String query = "select * from Post Order By date desc LIMIT ?,?";
		Object[] queryArgs = { begin, end };
		List<Map<String, Object>> res = jdbcTemplate.queryForList(query,
				queryArgs);
		for (Map<String, Object> line : res) {
			Post post = new Post();
			post.setId(Integer.parseInt(String.valueOf(line.get("idPost"))));
			post.setTitle(String.valueOf(line.get("title")));
			post.setNbViews(Integer.parseInt(String.valueOf(line
					.get("nb_views"))));
			post.setImageName(String.valueOf(line.get("image")));
			post.setDate((Date) line.get("date"));
			post.setContent((String.valueOf(line.get("content"))).substring(0,
					100) + "...");
			post.setLink((String) line.get("link"));
			posts.add(post);
		}
		return posts;
	}

	@Override
	public boolean incrementView(int idPost) {
		String query = "update Post set nb_views = nb_views + 1 where idPost = ?";
		int res = jdbcTemplate.update(query, idPost);
		if (res > 0)
			return true;
		return false;

	}

	@Override
	public List<Post> getRelatedPost(int category) {
		String query = "select * from Post where category=? order by nb_views,date desc LIMIT 5";
		List<Post> relatedPosts = new ArrayList<Post>();

		List<Map<String, Object>> res = jdbcTemplate.queryForList(query,
				category);
		for (Map<String, Object> line : res) {
			Post temp = new Post();
			temp.setId(Integer.parseInt(String.valueOf(line.get("idPost"))));
			temp.setTitle((String) line.get("title"));
			temp.setImageName((String) line.get("image"));
			temp.setLink((String) line.get("link"));
			temp.setCategory(Integer.parseInt(String.valueOf(line
					.get("category"))));

			relatedPosts.add(temp);
		}
		return relatedPosts;
	}

	@Override
	public boolean addTags(Post post) {
		String tags = post.getTags();

		int idPost = getPost(post.getLink()).getId();
		StringTokenizer stz = new StringTokenizer(tags, ",");
		while (stz.hasMoreElements()) {
			String query = "insert into Tags(idPost,name) values(?,?)";

			Object[] queryArgs = { idPost, stz.nextToken().trim() };
			int res = jdbcTemplate.update(query, queryArgs);
			if (res <= 0) {
				return false;
			}
		}
		return true;
	}

	@Override
	public boolean removeAllTags(int idPost) {
		String query = "delete from Tags where idPost=?";
		int res = jdbcTemplate.update(query, idPost);
		if (res > 0)
			return true;
		return false;
	}

	@Override
	public String getAllTags(int idPost) {
		String tags = "";
		String query = "select name from Tags where idPost=?";
		List<Map<String, Object>> res = jdbcTemplate
				.queryForList(query, idPost);
		for (Map<String, Object> line : res) {
			tags += line.get("name") + ",";
		}
		if (tags.length() > 0)
			tags = tags.substring(0, tags.length() - 1);
		return tags;
	}

	@Override
	public List<Post> getPostsByCategory(int category, int begin, int end) {
		List<Post> posts = new ArrayList<Post>();
		String query = "select * from Post where category=? Order By date desc LIMIT ?,?";
		Object[] queryArgs = { category, begin, end };
		List<Map<String, Object>> res = jdbcTemplate.queryForList(query,
				queryArgs);
		for (Map<String, Object> line : res) {
			Post post = new Post();
			post.setId(Integer.parseInt(String.valueOf(line.get("idPost"))));
			post.setTitle(String.valueOf(line.get("title")));
			post.setNbViews(Integer.parseInt(String.valueOf(line
					.get("nb_views"))));
			post.setImageName(String.valueOf(line.get("image")));
			post.setDate((Date) line.get("date"));
			post.setContent((String.valueOf(line.get("content"))).substring(0,
					100) + "...");
			post.setLink((String) line.get("link"));
			posts.add(post);
		}
		return posts;
	}

	@Override
	public List<Post> search(String search, int begin, int end) {
		List<Post> posts = new ArrayList<Post>();
		String query = "select P.* from Post P,Tags T where T.idPost=P.idPost and (";

		for (int i = 0; i < search.split(" ").length; i++) {
			query += " LOWER(T.name) like LOWER('%?%') or";
		}
		query = query.substring(0, query.length() - 2);
		query += ") order by P.date desc LIMIT ?,?";
		System.out.println(query);
		Object[] queryArgs = new Object[search.split(" ").length + 2];
		System.arraycopy(search.split(" "), 0, queryArgs, 0,
				search.split(" ").length);
		queryArgs[search.split(" ").length] = begin;
		queryArgs[search.split(" ").length + 1] = end;
		for (Object word : queryArgs) {
			System.out.println(word);
		}
		List<Map<String, Object>> res = jdbcTemplate.queryForList(query,
				queryArgs);
		for (Map<String, Object> line : res) {
			Post post = new Post();
			post.setId(Integer.parseInt(String.valueOf(line.get("idPost"))));
			post.setTitle(String.valueOf(line.get("title")));
			post.setNbViews(Integer.parseInt(String.valueOf(line
					.get("nb_views"))));
			post.setImageName(String.valueOf(line.get("image")));
			post.setDate((Date) line.get("date"));
			post.setContent((String.valueOf(line.get("content"))).substring(0,
					100) + "...");
			post.setLink((String) line.get("link"));
			posts.add(post);
		}
		return posts;
	}

	@Override
	public int countPages() {
		String query = "select count(*) As count from Post";
		int count = jdbcTemplate.queryForObject(query,
				new RowMapper<Integer>() {

					@Override
					public Integer mapRow(ResultSet res, int rowNum)
							throws SQLException {
						int result = res.getInt("count");
						return result;
					}

				});
		return count / 5 + (count % 5 > 0 ? 1 : 0);
	}

	@Override
	public int countPages(int category) {
		String query = "select count(*) As count from Post where category=?";
		int count = jdbcTemplate.queryForObject(query,
				new RowMapper<Integer>() {

					@Override
					public Integer mapRow(ResultSet res, int rowNum)
							throws SQLException {
						int result = res.getInt("count");
						return result;
					}

				}, category);
		return count / 5 + (count % 5 > 0 ? 1 : 0);
	}

	@Override
	public int countPages(String tags) {
		// TODO Auto-generated method stub
		return 0;
	}

}
