package com.uruk.blog.beans;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

/**
 * 
 * @author youssef abidi
 *
 */
public class User {

	private int id;

	@NotNull(message = "Please enter your first name")
	@Size(min = 2, max = 20, message = "The first name must be between 2 and 20 caracters")
	@Pattern(regexp = "[a-z-A-Z]*", message = "First name has invalid characters")
	private String firstName;

	@NotNull(message = "Please enter your last name")
	@Size(min = 2, max = 20, message = "The last name must be between 2 and 20 caracters")
	@Pattern(regexp = "[a-z-A-Z]*", message = "Last name has invalid characters")
	private String lastName;

	@Email(message = "Please enter valide email")
	private String email;

	@Pattern(regexp = "[a-z-A-Z]*", message = "please choose a valid country")
	private String country;

	private String picture;

	@Size(min = 4, max = 20)
	@Pattern(regexp = "[a-z-A-Z-0-9]*", message = "Invalide user name characters, use numbers and caracters only")
	private String userName;

	@Size(min = 6, max = 256, message = "The password must be between 4 and 30 caracters")
	private String password;

	private String role;

	public User() {

	}

	public User(int id, String firstName, String lastName, String email,
			String country, String picture, String login, String password,
			String role) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.country = country;
		this.picture = picture;
		this.userName = login;
		this.password = password;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String login) {
		this.userName = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
