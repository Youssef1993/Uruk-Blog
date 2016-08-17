package com.uruk.blog.controllers;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uruk.blog.beans.Post;
import com.uruk.blog.beans.User;
import com.uruk.blog.service.PostService;
import com.uruk.blog.service.UserService;

@Controller
@RequestMapping("/User")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;

	@RequestMapping("/{id}")
	public String displayProfile(Model model, @PathVariable("id") int id) {
		User user = userService.getUserInfo(id);
		List<Post> userPosts = postService.getUserPost(id);
		model.addAttribute("user", user);
		model.addAttribute("posts", userPosts);
		return "Profile";
	}

	/*
	 * Displays the page of user subscription
	 */
	@RequestMapping(value = "/Add", method = RequestMethod.GET)
	public String addUser(Model model) {

		model.addAttribute("countries", getCountrys());

		User user = new User();
		model.addAttribute("newUser", user);
		return "Join";
	}

	@InitBinder
	public void initialiseBinder(WebDataBinder binder) {
		binder.setDisallowedFields("id");

		// binder.setValidator(productValidator);
	}

	/*
	 * processes the user subscription
	 */
	@RequestMapping(value = "/Add", method = RequestMethod.POST)
	public String processAddUser(
			@ModelAttribute("newUser") @Valid User newUser,
			BindingResult result, Model model, HttpServletRequest request) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("Attempting	to	bind	disallowed	fields:	"
					+ StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if (result.hasErrors()) {
			model.addAttribute("countries", getCountrys());
			return "Join";
		} else if (userService.subscribe(newUser)) {
			HttpSession session = request.getSession();
			session.setAttribute("role", "MEMBER");
			session.setAttribute("id",
					userService.getUserId(newUser.getUserName()));
			return "redirect:/Members/User/Profile_Picture";
		} else {
			model.addAttribute("countries", getCountrys());
			return "Join";
		}

	}

	private Map<String, String> getCountrys() {

		Map<String, String> countryList = new LinkedHashMap<String, String>();
		String[] countrysCodes = Locale.getISOCountries();
		String countrysNames[] = new String[countrysCodes.length];
		for (int i = 0; i < countrysCodes.length; i++) {
			Locale obj = new Locale("", countrysCodes[i]);
			countrysNames[i] = obj.getDisplayCountry();
		}

		for (int i = 0; i < countrysCodes.length; i++) {
			countryList.put(countrysCodes[i], countrysNames[i]);
		}

		return countryList;
	}

}
