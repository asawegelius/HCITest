<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.reflect.Type"%>
<%@page import="com.google.gson.Gson"%>
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
				<a class="navbar-brand" href="index.jsp"
					onClick="nextPage('index');return false">HCI Test</a>
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
	<script type="text/javascript">
	<!--
		var d = document.getElementById("result");
		d.className += "active";
	//-->
	</script>
	<!-- container -->
	<div class="container">

		<div class="starter-template" class="test-screen">
			<div class="heading">
				<h2 class="panel-title pull-left">Result</h2>
				<div class="clearfix"></div>
			</div>
			<div class="page-content">
				<%
					Type listTypeInt = new TypeToken<List<Integer>>() {
					}.getType();
					Type listTypeDoub = new TypeToken<List<Double>>() {
					}.getType();
					List<Integer> rightList = new Gson().fromJson(request.getParameter("rightAnswer"), listTypeInt);
					List<Integer> rightListDistracted = new Gson().fromJson(request.getParameter("rightAnswerDistracted"),
							listTypeInt);
					List<Double> respList = new Gson().fromJson(request.getParameter("responseTime"), listTypeDoub);
					List<Double> respListDistracted = new Gson().fromJson(request.getParameter("responseTimeDistracted"),
							listTypeDoub);

					if (respList == null || respList.toString().equals("[-0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1]")) {
				%>
				<ul class="text-left">
					<li>The result will be here after you have taken the test</li>
					<li>Start the test by clicking the green start test button on
						the test page</li>
					<li>Check here after the test is completed</li>
				</ul>
			</div>
			<%
				// End of if
				} else {
					out.write("<script type='text/javascript'>");
					out.write("var resp = " + respList.toString() + ", right = " + rightList.toString()
							+ ", respDistracted = " + respListDistracted.toString() + ", rightDistracted = "
							+ rightListDistracted.toString() + ";");
			%>
			</script>
			<div class="col-md-6">
				<div class='ct-chart ct-golden-section text-left col-md-6'
					id='chart1'></div>

			</div>
			<div class="col-md-6">
				<div class='ct-chart ct-golden-section text-left col-md-6'
					id='chart3'></div>
			</div>
			<div class="col-md-6 text-left">
				<p>response time without distraction</p>
			</div>
			<div class="col-md-6 text-left">
				<p>response time with distraction</p>
			</div>

			<div class="col-md-6">
				<div class='ct-chart ct-golden-section text-left col-md-6'
					id='chart2'></div>
			</div>
			<div class="col-md-6">
				<div class='ct-chart ct-golden-section text-left col-md-6'
					id='chart4'></div>
			</div>

			<div class="col-md-6 text-left">
				<p>Right answer without distraction</p>
			</div>
			<div class="col-md-6 text-left">
				<p>Right answer with distraction</p>
			</div>
			<script>
				var optionsBar = {
					width : "18.45em",
					height : "17.75em"
				};

				var chart = new Chartist.Bar('#chart1', {
					labels : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
							'10' ],
					series : [ [ {
						meta : right[0],
						value : resp[0]
					}, {
						meta : right[1],
						value : resp[1]
					}, {
						meta : right[2],
						value : resp[2]
					}, {
						meta : right[3],
						value : resp[3]
					}, {
						meta : right[4],
						value : resp[4]
					}, {
						meta : right[5],
						value : resp[5]
					}, {
						meta : right[6],
						value : resp[6]
					}, {
						meta : right[7],
						value : resp[7]
					}, {
						meta : right[8],
						value : resp[8]
					}, {
						meta : right[9],
						value : resp[9]
					} ] ]
				}, optionsBar);

				var optionsPie = {
					width : "18.45em",
					height : "17.45em"
				};

				var rightvar = 0;
				var wrong = 0;
				var miss = 0;
				for ( var i in right) {
					if (right[i] == 1) {
						rightvar++;
					} else if (right[i] === 0) {
						wrong++;
					} else {
						miss++;
					}
				}

				new Chartist.Pie('#chart2', {
					series : [ {
						value : rightvar,
						meta : '1',
						className : "right"
					}, {
						value : wrong,
						meta : '0',
						className : "wrong"
					}, {
						value : miss,
						meta : '-1',
						className : "miss"
					} ]
				}, optionsPie);

				new Chartist.Bar('#chart3', {
					labels : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
							'10' ],
					series : [ [ {
						meta : rightDistracted[0],
						value : respDistracted[0]
					}, {
						meta : rightDistracted[1],
						value : respDistracted[1]
					}, {
						meta : rightDistracted[2],
						value : respDistracted[2]
					}, {
						meta : rightDistracted[3],
						value : respDistracted[3]
					}, {
						meta : rightDistracted[4],
						value : respDistracted[4]
					}, {
						meta : rightDistracted[5],
						value : respDistracted[5]
					}, {
						meta : rightDistracted[6],
						value : respDistracted[6]
					}, {
						meta : rightDistracted[7],
						value : respDistracted[7]
					}, {
						meta : rightDistracted[8],
						value : respDistracted[8]
					}, {
						meta : rightDistracted[9],
						value : respDistracted[9]
					} ] ]
				}, optionsBar);

				var rightvard = 0;
				var wrongd = 0;
				var missd = 0;
				i = 0;
				for (i in rightDistracted) {
					if (rightDistracted[i] == 1) {
						rightvard++;
					} else if (rightDistracted[i] === 0) {
						wrongd++;
					} else {
						missd++;
					}
				}

				new Chartist.Pie('#chart4', {
					series : [ {
						value : rightvard,
						meta : '1',
						className : "right"
					}, {
						value : wrongd,
						meta : '0',
						className : "wrong"
					}, {
						value : missd,
						meta : '-1',
						className : "miss"
					} ]
				}, optionsPie);
			</script>
			<%
				// End of else
				}
			%>
		</div>
	</div>
	<!-- /.container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script type="text/javascript" src="assets/js/main.js"></script>
	<script type="text/javascript" src="assets/js/showArrows.js"></script>
	<script type="text/javascript">
		function setVariables() {
	<%if (request.getParameter("rightAnswer") == null) {%>
		document.forms.navbar.namedItem("responseTime").value = JSON
					.stringify([ -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1,
							-0.1, -0.1, -0.1 ]);
			document.forms.navbar.namedItem("rightAnswer").value = JSON
					.stringify([ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ]);
			document.forms.navbar.namedItem("responseTimeDistracted").value = JSON
					.stringify([ -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1,
							-0.1, -0.1, -0.1 ]);
			document.forms.navbar.namedItem("rightAnswerDistracted").value = JSON
					.stringify([ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ]);
	<%// End of if
			} else {%>
		document.forms.navbar.namedItem("rightAnswer").value = JSON
					.stringify(
	<%out.print(request.getParameter("rightAnswer"));%>
		);
			;
			document.forms.navbar.namedItem("rightAnswerDistracted").value = JSON
					.stringify(
	<%out.print(request.getParameter("rightAnswerDistracted"));%>
		);
			;
			document.forms.navbar.namedItem("responseTime").value = JSON
					.stringify(
	<%out.print(request.getParameter("responseTime"));%>
		);
			;
			document.forms.navbar.namedItem("responseTimeDistracted").value = JSON
					.stringify(
	<%out.print(request.getParameter("responseTimeDistracted"));%>
		);
	<%// End of else
			}%>
		}
	</script>
</body>
</html>
