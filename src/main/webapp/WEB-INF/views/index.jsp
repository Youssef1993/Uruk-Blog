<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib	prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="abidi youssef">

    <title>Uruk Blog</title>
	
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="resources/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="resources/css/landing-page.css" />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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


    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>Uruk Blog</h1>
                        <h3>The most awesome blog ever</h3>
                        <hr class="intro-divider">
                        
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->

    <!-- Page Content -->
    
    <c:forEach items="${posts}" var="post" varStatus="status">
      <c:choose>
       <c:when test="${status.count%2==1 }">
				<div class="content-section-b">
					<div class="container">
						<div class="row">
							<div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
								<hr class="section-heading-spacer">
								<div class="clearfix"></div>
								<h2><a href="<c:url value="/Post/${post.link }" />" class="post-heading">
									<c:out value="${post.title }" />
								</a></h2>
								<p class="lead">
									<c:out value="${post.content }" />
								</p>
							</div>
							<div class="col-lg-5 col-sm-pull-6  col-sm-6">
								<img class="img-responsive"
									src="<c:url value="resources/img/post/${post.imageName }" />" alt="">
							</div>
						</div>

					</div>
					<!-- /.container -->

				</div>
			</c:when>
			<c:otherwise>
			  <div class="content-section-a">

					<div class="container">

						<div class="row">
							<div class="col-lg-5 col-sm-6">
								<hr class="section-heading-spacer">
								<div class="clearfix"></div>
								<h2><a href="<c:url value="/Post/${post.link }" />" class="post-heading">
									<c:out value="${post.title }" />
								</a></h2>
								<p class="lead">
									<c:out value="${post.content }" />
								</p>
							</div>
							<div class="col-lg-5 col-lg-offset-2 col-sm-6">
								<img class="img-responsive" src="resources/img/post/${post.imageName }" alt="">
							</div>
						</div>

					</div>
					</div>
			</c:otherwise>
      </c:choose>
    </c:forEach>

    
    

	
    <div class="banner">

        <div class="container">

            <div class="row">
                <div class="col-lg-6">
                    <h2>Connect to Start Bootstrap:</h2>
                </div>
                <div class="col-lg-6">
                    <ul class="list-inline banner-social-buttons">
                        <li>
                            <a href="https://web.facebook.com/youssef.abidi.948" class="btn btn-default btn-lg"><i class="fa fa-facebook fa-fw"></i> <span class="network-name">Facebook</span></a>
                        </li>
                        <li>
                            <a href="https://github.com/Youssef1993" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                        </li>
                        
                    </ul>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.banner -->

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#about">About</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#services">Services</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#contact">Contact</a>
                        </li>
                    </ul>
                    <p class="copyright text-muted small">Copyright &copy; Your Company 2014. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>
	
    <!-- jQuery -->
    <script src="<c:url value="resources/js/jquery.js" />"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="resources/js/bootstrap.min.js" />"></script>

</body>

</html>
