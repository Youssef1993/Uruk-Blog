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

    <title>Uruk Blog - <c:out value="${editPost.title }" /></title>
	
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
	
	<!-- Responsive bootstrap -->
	<link href="<c:url value="/resources/css/bootstrap-responsive.min.css" />" rel="stylesheet">
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
	
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
	  <h2><c:out value="${post.title}" /></h2>
	  <hr/>
	  <form:form modelAttribute="editPost" method="post" id="post-form"  enctype="multipart/form-data">
	  	   <form:input path="id" type="hidden"/>
	  	   
	       <div class="row">
	       <div class="col-md-6">
	       <div class="form-group">
	         <label class=control-label for="title"><spring:message code="NewPost.Form.Title" /></label>
	         <form:input type="text" path="title" class="form-control" />
	         <form:errors path="title" cssClass="text-danger" />
	       </div>
	       
	       <div class="form-group">
	          <label class="control-label" for="category"><spring:message code="NewPost.Form.Category" /></label>
	          <form:select path="category" items="${categorys }" class="form-control" />
	             
	          
	       </div>
	       
	       </div>
	       </div>
				<div class="form-group">
					<label class="control-label" for="content">Content</label>
					<div class="btn-toolbar" data-role="editor-toolbar"
						data-target="#editor">
						<div class="btn-group">
							<a class="btn dropdown-toggle" data-toggle="dropdown"
								title="Font"><i class="icon-font"></i><b class="caret"></b></a>
							<ul class="dropdown-menu">
							</ul>
						</div>
						<div class="btn-group">
							<a class="btn dropdown-toggle" data-toggle="dropdown"
								title="Font Size"><i class="icon-text-height"></i>&nbsp;<b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
								<li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
								<li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
							</ul>
						</div>
						<div class="btn-group">
							<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
								class="icon-bold"></i></a> <a class="btn" data-edit="italic"
								title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a> <a
								class="btn" data-edit="strikethrough" title="Strikethrough"><i
								class="icon-strikethrough"></i></a> <a class="btn"
								data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i
								class="icon-underline"></i></a>
						</div>
						<div class="btn-group">
							<a class="btn" data-edit="insertunorderedlist"
								title="Bullet list"><i class="icon-list-ul"></i></a> <a
								class="btn" data-edit="insertorderedlist" title="Number list"><i
								class="icon-list-ol"></i></a> <a class="btn" data-edit="outdent"
								title="Reduce indent (Shift+Tab)"><i
								class="icon-indent-left"></i></a> <a class="btn" data-edit="indent"
								title="Indent (Tab)"><i class="icon-indent-right"></i></a>
						</div>
						<div class="btn-group">
							<a class="btn" data-edit="justifyleft"
								title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
							<a class="btn" data-edit="justifycenter"
								title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
							<a class="btn" data-edit="justifyright"
								title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
							<a class="btn" data-edit="justifyfull"
								title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
						</div>
						<div class="btn-group">
							<a class="btn dropdown-toggle" data-toggle="dropdown"
								title="Hyperlink"><i class="icon-link"></i></a>
							<div class="dropdown-menu input-append">
								<input class="span2" placeholder="URL" type="text"
									data-edit="createLink" />
								<button class="btn" type="button">Add</button>
							</div>
							<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i
								class="icon-cut"></i></a>

						</div>

						
						<div class="btn-group">
							<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
								class="icon-undo"></i></a> <a class="btn" data-edit="redo"
								title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
						</div>
						<input type="text" data-edit="inserttext" id="voiceBtn"
							x-webkit-speech="">
					</div>
					
					<div id="editor">
     					 <c:out value="${editPost.content }" />
  				    </div>
				</div>
				<form:textarea path="content" id="hidden-text-area"></form:textarea>
				<form:errors path="content" cssClass="text-danger" />
				<div class="form-group">
				  <label for="tags"><spring:message code="NewPost.Form.Tags" /></label>
				  <form:input type="text" path="tags" class="form-control"/>
				</div>
			</form:form>
			<br/><br/>
	   <button class="btn btn-success" id="edit"><i class="fa fa-wrench" aria-hidden="true"></i> Edit</button>
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
    <!-- Editor wysiwyg -->
    <script src="<c:url value="/resources/js/bootstrap-wysiwyg.js" />"></script>
    <script src="<c:url value="/resources/js/prettify.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.hotkeys.js" />"></script>
    
	<script type="text/javascript">
	
	  $(function(){
	    function initToolbarBootstrapBindings() {
	      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
	            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
	            'Times New Roman', 'Verdana'],
	            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
	      $.each(fonts, function (idx, fontName) {
	          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
	      });
	      $('a[title]').tooltip({container:'body'});
	    	$('.dropdown-menu input').click(function() {return false;})
			    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
	        .keydown('esc', function () {this.value='';$(this).change();});

	      $('[data-role=magic-overlay]').each(function () { 
	        var overlay = $(this), target = $(overlay.data('target')); 
	        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
	      });
	      if ("onwebkitspeechchange"  in document.createElement("input")) {
	        var editorOffset = $('#editor').offset();
	        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
	      } else {
	        $('#voiceBtn').hide();
	      }
		};
		
	    initToolbarBootstrapBindings();  
		$('#editor').wysiwyg({ } );
	    
	    
	    $('#edit').click(function(){
			var newtext=$('#editor').text();	
	    	$('#hidden-text-area').val(newtext);
	    	$('#post-form').submit();
	    });
	  });
	</script>
    

</body>

</html>
