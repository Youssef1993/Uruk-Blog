package com.uruk.blog.service;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import com.uruk.blog.beans.User;

public interface UserService {

	public boolean subscribe(User user);

	public User getUserInfo(int id);

	public boolean updateUserInfo(User user);

	public boolean upadatePicture(int id, String picture);

	public User authentificateUser(String login, String password)
			throws InvalidKeySpecException, NoSuchAlgorithmException;

	public int getUserId(String username);
}
