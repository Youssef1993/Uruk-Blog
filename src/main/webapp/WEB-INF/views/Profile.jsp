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

    <title>Uruk Blog - My Profile</title>
	
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

	<div class="container form-style user-profile">
	 <div class=" user-info">
	     <c:choose>
	       <c:when test="${sessionScope.id == user.id }">
	         
	           <img src="<c:url value="/resources/img/user/${user.picture }" />" alt="profile picture" id="profile-image-edit" width=250/>
	           
	         
	       </c:when>
	       <c:otherwise>
	         <img src="<c:url value="/resources/img/user/${user.picture }" />" alt="profile picture" id="profile-image" width=250/>
	       </c:otherwise>
	     </c:choose>
	     
	   
	   
	     <div class="profile-info">
	       <p>
	       <span class="info-name"><spring:message	code="Adduser.form.firstName.label"/> :</span> 
	       <span class="info-value"><c:out value="${user.firstName }" /></span>
	       </p>
	       <p>
	       <span class="info-name"><spring:message	code="Adduser.form.lastName.label"/> :</span> 
	       <span class="info-value"><c:out value="${user.lastName }" /></span>
	       </p>
	       <p>
	       <span class="info-name"><spring:message	code="Adduser.form.email.label"/> :</span> 
	       <span class="info-value"><c:out value="${user.email }" /></span>
	       </p>
	       <p>
	       <span class="info-name"><spring:message	code="Adduser.form.country.label"/> :</span> 
	       <span class="info-value"><c:out value="${user.country }" /></span>
	       </p>
	       <p>
	       <span class="info-name"><spring:message	code="Adduser.form.userName.label"/> :</span> 
	       <span class="info-value"><c:out value="${user.userName }" /></span>
	       </p>
	       <br/><br/>
	       <c:if test="${sessionScope.id==user.id }">
	       <a href="<c:url value="/Members/EditProfile" />">
	         <button class="btn btn-default"><i class="fa fa-pencil" aria-hidden="true"></i> <spring:message code="Profile.EditInfoButton" /></button>
	       </a>
	       
	       </c:if>
	     </div>
	   
	 </div>
	 <div class="row user-posts">
	  <c:if test="${sessionScope.id==user.id }">
	    <a href="<c:url value="/Members/Post/add" />" ><button class="btn btn-link"><i class="fa fa-plus" aria-hidden="true"></i>  <spring:message code="Profile.CreateNewPost" /></button></a>
	   <br/>
	  </c:if>
	  
	   <c:choose>
	     <c:when test="${posts.size()>0 }">
	     <table class="table">
	      <c:forEach items="${posts}" var="item">
	        <tr>
	          <td>
	             <img src="<c:url value="/resources/img/post/${item.imageName }"/>" alt="<c:out value="${item.title }" />" width=200 height=120/>
	             <div class="post-mini-info">
	             <a href="<c:url value="/Post/${item.link }" />"><h3><c:out value="${item.title }" /></h3></a>
	             <p class="glimpse-of-post">"<c:out value="${item.content }" /></p><br/>
	             <span class="info-name"><spring:message code="Post.View.PublishDate" /> : </span><c:out value="${item.date }" /><br/>	            
	             <span class="info-name"><spring:message code="Post.View.NbViews" /> : </span><c:out value="${item.nbViews }" />
	             <br/>
	             
	             <c:if test="${sessionScope.id==user.id }">
	             <a href="<c:url value="/Members/Post/Edit/${item.link }" />"><button class="btn btn-link"><i class="fa fa-pencil" aria-hidden="true"></i> Edit</button></a>
	             <button class="btn btn-link"><i class="fa fa-trash" aria-hidden="true"></i> Delete</button>
	             </c:if>
	             </div>
	          </td>
	        </tr>
	      </c:forEach>
	    </table>
	     </c:when>
	     <c:otherwise>
	     <div class="centerd-item">
	       <i class="fa fa-ban fa-5x" aria-hidden="true"></i>
	       <p style="font-size:1.3em;"><spring:message code="Profile.NoPostsExisting" /></p>
	     </div>
	     </c:otherwise>
	   </c:choose>
	    
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
    <c:if test="${sessionScope.id==user.id }">
      <div class="no-show">
         <form method="post" id="upload-form" action="<c:url value="/Members/User/Profile_Picture" />" enctype="multipart/form-data">
		  <input type="file" name="file" id="file" class="inputfile" accept="image/*"/>
		  
		</form>
      </div>
      <script>
      $(function(){
    	 $('#profile-image-edit').click(function() {
       	  $('#file').click();
    	 });
    	 $('#file').change(function() {
    		 $('#upload-form').submit();
       	 });
    	 
      });
      </script>
    </c:if>
    

</body>

</html>
