package com.uruk.blog.beans;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class Post {

	private int id;
	private int idUser;
	@NotNull
	@Size(min = 5, max = 40, message = "{Size.Post.title}")
	private String title;
	private String link;
	@NotNull
	@Size(min = 100, message = "{Size.Post.content}")
	private String content;
	private int nbViews;
	private Date date;
	private int category;
	private MultipartFile image;
	private String imageName;
	private String tags;

	public Post() {

	}

	public Post(int id, int idUser, String title, String content, int nbViews,
			Date date, int category, MultipartFile image, String imageName,
			String link, String tags) {
		super();
		this.id = id;
		this.idUser = idUser;
		this.title = title;
		this.content = content;
		this.nbViews = nbViews;
		this.date = date;
		this.category = category;
		this.image = image;
		this.imageName = imageName;
		this.link = link;
		this.tags = tags;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getNbViews() {
		return nbViews;
	}

	public void setNbViews(int nbViews) {
		this.nbViews = nbViews;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

}
