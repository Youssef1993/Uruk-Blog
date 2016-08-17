package com.uruk.blog.controllers;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uruk.blog.beans.Post;
import com.uruk.blog.beans.User;
import com.uruk.blog.service.PostService;
import com.uruk.blog.service.UserService;

@Controller
public class Main {

	@Autowired
	PostService postService;

	@Autowired
	UserService userService;

	@RequestMapping("/")
	public String welcome(Model model) {
		List<Post> postList = postService.getLastThreePosts();
		model.addAttribute("posts", postList);
		return "index";
	}

	@RequestMapping("/login")
	public String login(Model model) {

		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String processLogin(Model model, HttpServletRequest request)
			throws InvalidKeySpecException, NoSuchAlgorithmException {
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		User user = userService.authentificateUser(login, password);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", user.getId());
			session.setAttribute("role", user.getRole());
			return "redirect:/";
		}
		model.addAttribute("error", true);

		return "login";
	}

	@RequestMapping("/Logout")
	public String logout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
}
