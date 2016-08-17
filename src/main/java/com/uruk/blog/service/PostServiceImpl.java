package com.uruk.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.uruk.blog.beans.Post;
import com.uruk.blog.dao.PostDAO;

public class PostServiceImpl implements PostService {

	@Autowired
	private PostDAO postDao;

	@Override
	public boolean addPost(Post post) {
		post.setLink(post.getTitle().replace(' ', '_'));
		return postDao.addPost(post);
	}

	@Override
	public boolean modifyPost(Post post) {
		post.setLink(post.getTitle().replace(' ', '_'));
		postDao.modifyPost(post);
		postDao.removeAllTags(post.getId());
		postDao.addTags(post);
		return true;
	}

	@Override
	public boolean deletePost(int id) {

		return false;
	}

	@Override
	public Post getPost(String link) {

		return postDao.getPost(link);
	}

	@Override
	public List<Post> getUserPost(int idUser) {

		return postDao.getUserPost(idUser);
	}

	@Override
	public List<Post> getLastThreePosts() {

		return postDao.getLastThreePosts();
	}

	@Override
	public List<Post> getPage(int page) {
		int begin = page * 5 - 5;
		int end = page * 5;

		return postDao.getPage(begin, end);
	}

	@Override
	public boolean incrementView(int idPost) {

		return postDao.incrementView(idPost);
	}

	@Override
	public List<Post> getRelatedPost(int category) {

		return postDao.getRelatedPost(category);
	}

	@Override
	public List<Post> getPostsByCategory(int category, int page) {
		int begin = page * 5 - 5;
		int end = page * 5;

		return postDao.getPostsByCategory(category, begin, end);
	}

	@Override
	public List<Post> search(String search, int page) {
		int begin = page * 5 - 5;
		int end = page * 5;
		return postDao.search(search, begin, end);
	}

	@Override
	public int countPages() {
		return postDao.countPages();
	}

	@Override
	public int countPages(int category) {
		return postDao.countPages(category);
	}

	@Override
	public int countPages(String tags) {
		// TODO Auto-generated method stub
		return 0;
	}

}
