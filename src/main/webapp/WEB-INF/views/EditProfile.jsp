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

    <title>Uruk Blog - Edit Profile</title>
	
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
                    <li>
                        <a href="<c:url value="/Post/Posts/1" />"><i class="fa fa-tasks" aria-hidden="true"></i> Posts</a>
                    </li>
                    <li>
                        <a href="<c:url value="/Members/Profile" />"><i class="fa fa-user" aria-hidden="true"></i> Profile</a>
                    </li>
                    <li>
                        <a href="<c:url value="/Logout" />"><i class="fa fa-sign-in" aria-hidden="true"></i>  Logout</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>


    

    <!-- Page Content -->

	<div class="container form-style">
	 <h2>Edit Profile Info</h2>
	 <br/>
	 <hr>
	 <br/>
	  <div class="col-md-7">
		<form:form modelAttribute="editUser" class="form-horizontal">
			
			<fieldset>
			   
				<div class="form-group">
					<label class="control-label	col-lg-2	col-lg-2" for="firstName">
						<spring:message	code="Adduser.form.firstName.label"/>
					</label>
					<div class="col-lg-10">
						<form:input id="firstName" path="firstName" type="text" class="form-control" />
						<form:errors path="firstName" cssClass="text-danger" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label	col-lg-2	col-lg-2" for="lastName">
						<spring:message	code="Adduser.form.lastName.label"/>
					</label>
					<div class="col-lg-10">
						<form:input id="lastName" path="lastName" type="text"
							class="form-control" />
						<form:errors path="lastName" cssClass="text-danger" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label	col-lg-2	col-lg-2" for="email">
						<spring:message	code="Adduser.form.email.label"/>
					</label>
					<div class="col-lg-10">
						<form:input id="email" path="email" type="email"
							class="form-control" />
						<form:errors path="email" cssClass="text-danger" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label	col-lg-2	col-lg-2" for="country">
						<spring:message	code="Adduser.form.country.label"/>
					</label>
					<div class="col-lg-10">
						<form:select path="country" items="${countries}" class="form-control" />
						
						<form:errors path="country" cssClass="text-danger" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label	col-lg-2	col-lg-2" for="userName">
						<spring:message	code="Adduser.form.userName.label"/>
					</label>
					<div class="col-lg-10">
						<form:input id="userName" path="userName" type="text"
							class="form-control" />
						<form:errors path="userName" cssClass="text-danger" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label	col-lg-2	col-lg-2" for="password">
						<spring:message	code="Adduser.form.password.label"/>
					</label>
					<div class="col-lg-10">
						<form:input id="password" path="password" type="text"
							class="form-control" />
						<form:errors path="password" cssClass="text-danger" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-lg-offset-2	col-lg-10">
						<form:button  class="btn btn-primary" ><i class="fa fa-plus" aria-hidden="true"></i>  <spring:message	code="Adduser.form.submit.button"/></form:button>
					</div>
				</div>
			</fieldset>
		</form:form>
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

</body>

</html>
