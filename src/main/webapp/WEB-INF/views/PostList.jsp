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

    <title>Uruk Blog - Posts</title>
	
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
				<form class="navbar-form navbar-right" method="get" action="<c:url value="/Post/Posts/1" />">
					<div class="form-group">
						<input type="text" name="search" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Search</button>
				</form>
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
	  <c:if test="${!pageOutOfRange}">
	  <div id="posts-menu">
	    <form id="category" method="get" action="<c:url value="/Post/Posts/1" />" class="form-inline">
	      <div class="form-group">
	        <label><spring:message code="PostList.ChooseCategory"/> : </label>
	        <select name="category" class="form-control">
	         <option></option>
	          <c:forEach items="${categorys }" var="item" varStatus="status">
	           <option value="${item.key }" class="category-option"><c:out value="${item.value }" /></option>
	          </c:forEach>
	        </select>
	      </div>
	      
	    </form>
	  </div>
	  </c:if>
	  <div class="posts">
	   <table class="table">
	   <c:forEach items="${posts}" var="post" varStatus="status">
	    <tr><td>
	     
	     <img src="<c:url value="/resources/img/post/${post.imageName }" />" alt="<c:out value="${post.title }" />" width=150 height=100 class="post-list-image" />
	     <div style="display:inline-block;">
	       <h3><c:out value="${post.title }" /></h3>
	       <p class="glimpse-of-post">"<c:out value="${post.content }" /></p><br/>
	       <span class="info-name-min"><spring:message code="Post.View.PublishDate" /> : </span><span class="info-value-min"><c:out value="${post.date }" /></span><br/>	            
	       <span class="info-name-min"><spring:message code="Post.View.NbViews" /> : </span><span class="info-value-min"><c:out value="${post.nbViews }" /></span>
	       <br/><br/>
	       <a href="<c:url value="/Post/${post.link }" />" class="pagination-link"><button class="btn btn-primary"><spring:message code="PostList.ReadMoreButton" /> >></button></a>
	       <br/><br/>
	     </div>
	     </td></tr>
	   </c:forEach>
	  </table>
	  <c:if test="${pageOutOfRange}">
				<div class="container form-style page-not-found">
					<h1>404 Page Not Found</h1>
					<img src="<c:url value="../../resources/img/crash.jpg" />" alt="404" />
					<p>Ooops , the page you're looking for deosn't exist !</p>
				</div>
	  </c:if>
	  <c:if test="${!pageOutOfRange}">
	  <div class="pagination-buttons">
	    <div class="btn-toolbar" role="toolbar">
	      <div class="btn-group" role="group">
	         <c:forEach begin="${minPaginationNumber}" end="${maxPaginationNumber}" varStatus="status">
	         
	          <c:choose>
	           <c:when test="${currentPage == status.index }">
	             <button class="btn btn-default active" disabled><c:out value="${status.index}" /></button>
	           </c:when>
	           <c:otherwise>
	             <a href="<c:url value="/Post/Posts/${status.index}" />"<c:if test="${param.category!=null}"><c:out value="?category=${param.category }"/></c:if><c:if test="${param.search!=null}"><c:out value="?search=${param.search }"/></c:if>><button class="btn btn-default"><c:out value="${status.index}" /></button></a>
	           </c:otherwise>
	          </c:choose>
	          
	         </c:forEach>
	         
	      </div>
	    </div>
	  </div>
	  </c:if>
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
    <script>
    $(function(){
    	$('#category').change(function(){
			
	    	$('#category').submit();
	    });
    });
    </script>
</body>

</html>
