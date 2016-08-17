package com.uruk.blog.dao;

import java.util.List;

import com.uruk.blog.beans.Post;

public interface PostDAO {

	public boolean addPost(Post post);

	public boolean modifyPost(Post post);

	public boolean deletePost(int id);

	public Post getPost(String link);

	public List<Post> getUserPost(int idUser);

	public List<Post> getLastThreePosts();

	public List<Post> getPage(int begin, int end);

	public boolean incrementView(int idPost);

	public List<Post> getRelatedPost(int category);

	public List<Post> getPostsByCategory(int category, int begin, int end);

	public List<Post> search(String search, int begin, int end);

	public int countPages();

	public int countPages(int category);

	public int countPages(String tags);

	public boolean addTags(Post post);

	public boolean removeAllTags(int idPost);

	public String getAllTags(int idPost);

}
