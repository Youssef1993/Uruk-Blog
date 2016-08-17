package com.uruk.blog.service;

import java.util.List;

import com.uruk.blog.beans.Post;

public interface PostService {
	public boolean addPost(Post post);

	public boolean modifyPost(Post post);

	public boolean deletePost(int id);

	public Post getPost(String link);

	public List<Post> getUserPost(int idUser);

	public List<Post> getLastThreePosts();

	public List<Post> getPage(int page);

	public boolean incrementView(int idPost);

	public List<Post> getRelatedPost(int category);

	public List<Post> getPostsByCategory(int category, int page);

	public List<Post> search(String search, int pages);

	public int countPages();

	public int countPages(int category);

	public int countPages(String tags);

}
