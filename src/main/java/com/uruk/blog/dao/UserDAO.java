package com.uruk.blog.dao;

import com.uruk.blog.beans.User;

public interface UserDAO {

	public boolean subscribe(User user);

	public User getUserInfo(int id);

	public boolean updateUserInfo(User user);

	public boolean upadatePicture(int id, String picture);

	public User authentificateUser(String login);

	public int getUserId(String username);

}
