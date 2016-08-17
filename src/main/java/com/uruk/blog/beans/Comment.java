package com.uruk.blog.beans;

import java.util.Date;

public class Comment {

	private int id;
	private int UserId;
	private int ArticleId;
	private Date date;
	private String content;

	public Comment() {

	}

	public Comment(int id, int userId, int articleId, Date date, String content) {
		super();
		this.id = id;
		UserId = userId;
		ArticleId = articleId;
		this.date = date;
		this.content = content;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		UserId = userId;
	}

	public int getArticleId() {
		return ArticleId;
	}

	public void setArticleId(int articleId) {
		ArticleId = articleId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
