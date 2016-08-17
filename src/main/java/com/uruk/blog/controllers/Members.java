package com.uruk.blog.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Random;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.uruk.blog.beans.Post;
import com.uruk.blog.beans.User;
import com.uruk.blog.dao.CategoryDAO;
import com.uruk.blog.service.PostService;
import com.uruk.blog.service.UserService;

@Controller
@RequestMapping("/Members/")
public class Members {

	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;
	@Autowired
	private CategoryDAO categoryDao;

	/*
	 * Displays the page of adding a profile picture
	 */
	@RequestMapping("/User/Profile_Picture")
	public String uploadProfilePicture(Model model) {

		return "UploadProfilePicture";
	}

	/*
	 * processes the picture upload
	 */
	@RequestMapping(value = "/User/Profile_Picture", method = RequestMethod.POST)
	public String processProfilePicture(
			@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("id");

		String rootDirectory = request.getSession().getServletContext()
				.getRealPath("/");
		if (file != null && !file.isEmpty()) {
			try {
				File userImage = new File(rootDirectory
						+ "/resources/img/user/" + id + ".jpg");

				file.transferTo(userImage);
				if (userService.upadatePicture(id, userImage.getName())) {
					return "redirect:/Members/Profile";
				} else {
					return "UploadProfilePicture";
				}

			} catch (Exception e) {

				return "UploadProfilePicture";
			}
		}
		return "UploadProfilePicture";

	}

	@RequestMapping("/Profile")
	public String displayProfile(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("id");
		User user = userService.getUserInfo(id);
		List<Post> userPosts = postService.getUserPost(id);
		model.addAttribute("user", user);
		model.addAttribute("posts", userPosts);
		return "Profile";
	}

	@RequestMapping("/EditProfile")
	public String editProfile(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("id");
		User user = userService.getUserInfo(id);
		model.addAttribute("editUser", user);

		/*
		 * This table is going to contain the list of all the countrys
		 */
		String[] countrysCodes = Locale.getISOCountries();
		String countrysNames[] = new String[countrysCodes.length];
		for (int i = 0; i < countrysCodes.length; i++) {

			Locale obj = new Locale("", countrysCodes[i]);
			countrysNames[i] = obj.getDisplayCountry();

		}
		model.addAttribute("countriesKeys", countrysCodes);
		model.addAttribute("countries", countrysNames);
		/*
		 * Adding user object for binding
		 */

		return "EditProfile";
	}

	/**************/

	@RequestMapping("/Post/add")
	public String addPost(Model model) {
		/*
		 * we add the list of all the categories for the user to choose from
		 */
		model.addAttribute("categorys", categoryDao.getAllCategorys());
		model.addAttribute("newPost", new Post());
		return "AddPost";
	}

	@InitBinder
	public void initialiseBinder(WebDataBinder binder) {
		binder.setDisallowedFields("nbViews", "date", "idUser", "imageName",
				"role");

	}

	@RequestMapping(value = "/Post/add", method = RequestMethod.POST)
	public String processAddpost(
			@ModelAttribute("newPost") @Valid Post newPost,
			BindingResult result, HttpServletRequest request, Model model)
			throws IllegalStateException, IOException {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("Attempting	to	bind	disallowed	fields:	"
					+ StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if (!result.hasErrors()) {
			HttpSession session = request.getSession();
			int userId = (int) session.getAttribute("id");
			String rootDirectory = request.getSession().getServletContext()
					.getRealPath("/");
			if (newPost.getImage() != null && !newPost.getImage().isEmpty()) {
				String imageName = newPost.getTitle().replace(' ', '_')
						+ userId + new Random().nextInt(1000);
				System.out.println(newPost.getTitle());
				File postImage = new File(rootDirectory
						+ "/resources/img/post/" + imageName);
				newPost.getImage().transferTo(postImage);
				newPost.setImageName(imageName);
			}
			newPost.setIdUser(userId);
			if (postService.addPost(newPost)) {
				return "redirect:/Members/Profile";
			}
		}

		model.addAttribute("categorys", categoryDao.getAllCategorys());
		return "AddPost";
	}

	@RequestMapping("/Post/Edit/{link}")
	public String editPost(Model model, @PathVariable("link") String link,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("id");
		Post post = postService.getPost(link);
		if (id == post.getIdUser()) {
			model.addAttribute("editPost", post);
			model.addAttribute("categorys", categoryDao.getAllCategorys());
			return "EditPost";
		}

		return "404";
	}

	@RequestMapping(value = "/Post/Edit/{link}", method = RequestMethod.POST)
	public String processEditPost(
			@ModelAttribute("editPost") @Valid Post editPost, Model model,
			@PathVariable("link") String link, BindingResult result,
			HttpServletRequest request) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("Attempting	to	bind	disallowed	fields:	"
					+ StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if (!result.hasErrors()) {
			HttpSession session = request.getSession();
			int idUser = (int) session.getAttribute("id");

			editPost.setIdUser(idUser);
			if (postService.modifyPost(editPost)) {
				return "redirect:/Members/Profile";
			}
		}

		model.addAttribute("editPost", editPost);
		model.addAttribute("categorys", categoryDao.getAllCategorys());
		return "EditPost";
	}

}
