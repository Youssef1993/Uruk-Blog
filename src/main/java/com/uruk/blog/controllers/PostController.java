package com.uruk.blog.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uruk.blog.beans.Post;
import com.uruk.blog.beans.User;
import com.uruk.blog.dao.CategoryDAO;
import com.uruk.blog.exception.PostNotFoundException;
import com.uruk.blog.service.PostService;
import com.uruk.blog.service.UserService;

@Controller
@RequestMapping("/Post")
public class PostController {

	@Autowired
	private PostService postService;

	@Autowired
	private CategoryDAO categoryDao;

	@Autowired
	UserService userService;

	@RequestMapping(value = { "/Posts/{page}" })
	public String PostList(
			Model model,
			@PathVariable("page") String page,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "search", required = false) String search) {
		model.addAttribute("categorys", categoryDao.getAllCategorys());
		int pageNum = 1;

		if (page != null)
			pageNum = Integer.parseInt(page);

		int maxPages = 0;
		if (category != null) {
			maxPages = postService.countPages(Integer.parseInt(category));
			if (pageNum > maxPages) {
				model.addAttribute("pageOutOfRange", true);
				return "PostList";
			}
			model.addAttribute("posts", postService.getPostsByCategory(
					Integer.parseInt(category), pageNum));

		} else if (search != null) {
			maxPages = postService.countPages(search);
			if (pageNum > maxPages) {
				// model.addAttribute("pageOutOfRange", true);
				// return "PostList";
			}
			model.addAttribute("posts", postService.search(search, pageNum));
		} else {
			maxPages = postService.countPages();
			if (pageNum > maxPages) {
				model.addAttribute("pageOutOfRange", true);
				return "PostList";
			}
			model.addAttribute("posts", postService.getPage(pageNum));
		}
		int minPaginationNumber = (pageNum - 3 >= 1 ? pageNum - 3 : 1);
		int maxPaginationNumber = (pageNum + 3 <= maxPages ? pageNum + 3
				: maxPages);
		model.addAttribute("minPaginationNumber", minPaginationNumber);
		model.addAttribute("maxPaginationNumber", maxPaginationNumber);
		model.addAttribute("maxPages", maxPages);
		model.addAttribute("currentPage", pageNum);
		return "PostList";
	}

	/*
	 * Displays Post
	 */
	@RequestMapping("/{link}")
	public String showArticle(Model model, @PathVariable("link") String link) {
		Post post = postService.getPost(link);
		postService.incrementView(post.getId());
		model.addAttribute("post", post);
		User publisher = userService.getUserInfo(post.getIdUser());
		model.addAttribute("publisher", publisher);
		List<Post> relatedPosts = postService
				.getRelatedPost(post.getCategory());
		model.addAttribute("relatedPosts", relatedPosts);

		return "Post";
	}

	@ExceptionHandler(PostNotFoundException.class)
	public ModelAndView exceptionHandler(HttpServletRequest request,
			PostNotFoundException exception) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("404");
		return mav;
	}

}
