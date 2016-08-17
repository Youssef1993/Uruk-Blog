package com.uruk.blog.exception;

public class PostNotFoundException extends RuntimeException {

	private static final long serialVersionUID = -694354952032299587L;
	private static final String exceptionText = "The post you are looking for deosn't exist or has been deleted";

	public PostNotFoundException() {

	}
}
