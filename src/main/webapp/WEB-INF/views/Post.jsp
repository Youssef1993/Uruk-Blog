<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib	prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@	taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="abidi youssef">

    <title>Uruk Blog - <c:out value="${post.title }" /></title>
	
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/css/landing-page.css" />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<link href="<c:url value="/resources/css/my-style.css" />" rel="stylesheet">
	
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav" href="<c:url value="/" />"><i class="fa fa-home" aria-hidden="true"></i>  Home</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                    <c:when test="${sessionScope.role !=null }">
					 <li>
                        <a href="<c:url value="/Post/Posts/1" />"><i class="fa fa-tasks" aria-hidden="true"></i> Posts</a>
                     </li>
                     <li>
                        <a href="<c:url value="/Members/Profile" />"><i class="fa fa-user" aria-hidden="true"></i> Profile</a>
                     </li>
                     <li>
                        <a href="<c:url value="/Logout" />"><i class="fa fa-sign-in" aria-hidden="true"></i>  Logout</a>
                     </li>
					</c:when>
					<c:otherwise>
					 <li>
                        <a href="<c:url value="/Post/Posts/1" />"><i class="fa fa-tasks" aria-hidden="true"></i> Posts</a>
                     </li>
                     <li>
                        <a href="<c:url value="/User/Add" />"><i class="fa fa-plus" aria-hidden="true"></i> Join</a>
                     </li>
                     <li>
                        <a href="<c:url value="/login" />"><i class="fa fa-sign-in" aria-hidden="true"></i>  Login</a>
                     </li>
					</c:otherwise>
                  </c:choose>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>


    

    <!-- Page Content -->

	<div class="container form-style">
	  
	  
	  <div class="row">
	    <div class="col-md-8">
	    		<h2><c:out value="${post.title}" /></h2>
	    		<hr/>
				<p class="post-content">
					<img src="<c:url value="/resources/img/post/${post.imageName }" />" alt="<c:out value="${post.title }" />" width=350 style="float: left" />
					<c:out value="${post.content }" escapeXml="false" />
				</p>
		</div>
		<div class="col-md-4">
		  <h3><spring:message code="Post.View.Suggestion" /></h3>
		  <hr/>
		  <c:forEach items="${relatedPosts }" var="item">
		    <div class="suggestion-element">
		      <img src="<c:url value="/resources/img/post/${item.imageName }" />" width=100 height=80/>
		      <a href="<c:url value="/Post/${item.link }" />" ><c:out value="${item.title }" /></a>
		      
		    </div>
		  </c:forEach>
		</div>
	  </div>
	  
	  <hr/>
	  <div class="left-side">
	    <img src="<c:url value="/resources/img/user/${publisher.picture }" />" alt="<c:out value="${publisher.firstName }" />" width=50 height=50/>
	    <a href="<c:url value="/User/${publisher.id }" />" > <c:out value="${publisher.firstName }" /> <c:out value="${publisher.lastName }" /></a>
	  </div>
	  <div class="right-side">
	     
	    <spring:message code="Post.View.PublishDate" /> : <c:out value="${post.date }" /><br/>
	    <spring:message code="Post.View.NbViews" /> : <c:out value="${post.nbViews }" /> 
	  </div>
    </div>
    <!-- /.content-section-a -->

	
    

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li>
                            <a href="<c:url value="/" />">Home</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="<c:url value="/About" />">About</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="<c:url value="/Language" />">Language</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="<c:url value="/Contact" />">Contact</a>
                        </li>
                    </ul>
                    <p class="copyright text-muted small">Copyright &copy; Your Company 2014. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>
	
    <!-- jQuery -->
    <script src="<c:url value="/resources/js/jquery.js" />"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <!-- Moment.js for date formatting -->
    <script src="<c:url value="/resources/js/moment.min.js" />"></script>

</body>

</html>
