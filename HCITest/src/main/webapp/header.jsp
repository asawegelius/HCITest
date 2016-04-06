<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>HCI Test</title>

<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="../../assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Chart library for this template -->
<script src="assets/js/chartist.min.js"></script>
<link href="assets/css/chartist.css" rel="stylesheet">


<!-- Styles for this template -->
<link href="assets/css/starter-template.css" rel="stylesheet">
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/barcolors.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body onload="setVariables()">

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp" onClick="nextPage('index');return false">HCI Test</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<form name="navbar" action="post" name="result">
					<ul class="nav navbar-nav">
						<li id="instructions"><a href="instructions.jsp"
							onClick="nextPage('instructions');return false">Instructions</a></li>
						<li id="thetest"><a href="thetest.jsp"
							onClick="nextPage('thetest');return false">The test</a></li>
						<li id="result"><a href="result.jsp"
							onClick="nextPage('result');return false">Result</a></li>
						<li id="about"><a href="#about">About</a></li>
						<li id="contact"><a href="#contact">Contact</a></li>
					</ul>
					<input type="hidden" name="address" value=""> <input
						type="hidden" name="responseTime" value=""> <input
						type="hidden" name="rightAnswer" value=""> <input
						type="hidden" name="responseTimeDistracted" value=""> <input
						type="hidden" name="rightAnswerDistracted" value="">
				</form>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>