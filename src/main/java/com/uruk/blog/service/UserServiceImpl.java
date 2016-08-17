package com.uruk.blog.service;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import org.springframework.beans.factory.annotation.Autowired;

import com.uruk.blog.beans.User;
import com.uruk.blog.dao.UserDAO;

public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDao;

	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	@Override
	public boolean subscribe(User user) {

		try {
			user.setPassword(PasswordHash.generateStorngPasswordHash(user
					.getPassword()));
			userDao.subscribe(user);
			return true;
		} catch (NoSuchAlgorithmException e) {

			e.printStackTrace();
		} catch (InvalidKeySpecException e) {

			e.printStackTrace();
		}
		return false;
	}

	@Override
	public User getUserInfo(int id) {

		return userDao.getUserInfo(id);
	}

	@Override
	public boolean updateUserInfo(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean upadatePicture(int id, String picture) {

		return userDao.upadatePicture(id, picture);
	}

	@Override
	public User authentificateUser(String login, String password)
			throws InvalidKeySpecException, NoSuchAlgorithmException {
		User user = userDao.authentificateUser(login);
		if (user.getId() > 0)
			if (PasswordHash.validatePassword(password, user.getPassword()))
				return user;
		return null;
	}

	@Override
	public int getUserId(String username) {
		return userDao.getUserId(username);
	}

}
