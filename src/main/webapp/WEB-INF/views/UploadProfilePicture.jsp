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

    <title>Uruk Blog - Upload Profile Picture</title>
	
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
	 <h2 class="centerd-item"><spring:message code="UploadPicture.Text" /> </h2>
	 <br/>
	 <br/><br/>
	 <div class="Image-upload-form">
		<form method="post" id="upload-form" action="" enctype="multipart/form-data">
		  <input type="file" name="file" id="file" class="inputfile" accept="image/*"/>
		  <label for="file"><spring:message code="UploadPicture.UploadButton" /> <i class="fa fa-upload" aria-hidden="true"></i></label>
		</form>
		<p id="display-image-name"></p>
	</div>
	 <br/><br/>
	 <div class="on-left-button">
	 	<button class="btn btn-success marged-button" id="trigger-upload"><spring:message code="UploadPicture.SubmitButton" /> <i class="fa fa-upload" aria-hidden="true"></i></button>
	 	<a href="<c:url value="/User/Members/Profile" />">
	 	 <button class="btn btn-primary"><spring:message code="UploadPicture.SkipButton" /> <i class="fa fa-arrow-right" aria-hidden="true"></i></button>
	 	</a>
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
    
    <script type="text/javascript">
    $( "#file" ).change(function() {
    	  $('#display-image-name').empty();
    	  $('#display-image-name').append($(this).val());
    	});
    $( "#trigger-upload" ).click(function() {
    	  $( "#upload-form" ).submit();
    });
    </script>

</body>

</html>
