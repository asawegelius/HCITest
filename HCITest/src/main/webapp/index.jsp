<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<!-- Styles for this template -->
<link href="assets/css/starter-template.css" rel="stylesheet">
<link href="assets/css/main.css" rel="stylesheet">

<!-- Chart library for this template -->
<link rel="stylesheet" href="assets/css/chartist.min.css">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

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
				<a class="navbar-brand" href="#">HCI Test</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">The test</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">

		<div class="starter-template" class="test-screen">
			<h1>The test</h1>
			<div class="row">

				<div class="col-sm-8">
					<div class="test-screen">
						<div class="red-spot">
							<img src="assets/img/empty.png" alt="red spot" />
						</div>
						<div class="arrow">
							<img id="arrow" src="assets/img/empty.png" alt="left arrow" />
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div id="tabbox">
						<a href="#" id="score" class="tab score"> score </a> <a href="#"
							id="instruction" class="tab select"> instruction </a>

					</div>
					<div id="panel">
						<div id="instructionbox">
							<ul class="text-left">
								<li>The test takes max 3 minutes</li>
								<li>You shall press the left arrow key when the left arrow
									appears</li>
								<li>You shall press the right arrow key when the right
									arrow appears</li>
								<li>It is your first click that counts</li>
							</ul>
						</div>
						<div id="scorebox">
							<div class=”ct-chart”></div>

							<script>
							Chartist.Line('.ct-chart', {
									  labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
									  series: [[0, 3, 2, 8, 9], [1, 2, 3, 5, 8]]
									}, {
									  width: '300px',
									  height: '200px'
									});
							</script>
						</div>
					</div>
				</div>
				<div class="pull-right">
					<button type="button" class="btn btn-success"
						onclick="showArrows()">Start test</button>
				</div>
			</div>
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
	<script src="../../dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript">
		var clickedTime;
		var createdTime;
		var reactionTime;
		var timeoutID;
		var turn = 0;
		var testing = false;
		var responseTime = [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ];
		var rightAnswer = [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ];
		window.addEventListener("keydown", checkKeyPressed, false);

		function checkKeyPressed(e) {
			if (testing) {
				switch (e.keyCode) {
				case 37:
					clickedTime = Date.now();
					var img = document.getElementById('arrow');
					if (img.src.indexOf('leftArrow.png') > -1
							&& rightAnswer[turn - 1] < 0) {
						rightAnswer[turn - 1] = 1;
					} else {
						rightAnswer[turn - 1] = 0;
					}
					reactionTime = (clickedTime - createdTime) / 1000;
					responseTime[turn - 1] = reactionTime;
					break;
				case 39:
					clickedTime = Date.now();
					var img = document.getElementById('arrow');
					if (img.src.indexOf('rightArrow.png') > -1
							&& rightAnswer[turn - 1] < 0) {
						rightAnswer[turn - 1] = 1;
					} else {
						rightAnswer[turn - 1] = 0;
					}
					reactionTime = (clickedTime - createdTime) / 1000;
					responseTime[turn - 1] = reactionTime;
					break;
				default:
					clickedTime = Date.now();
					reactionTime = (clickedTime - createdTime) / 1000;
					responseTime[turn - 1] = reactionTime;
					break;
				}
			}
		}

		function showArrows() {
			createdTime = Date.now();
			testing = true;
			timeoutID = window.setTimeout(randomArrow, 2000);
		}

		function betweenArrows() {
			document.getElementById('arrow').src = "assets/img/empty.png"
			timeoutID = window.setTimeout(randomArrow, 500);
		}

		function randomArrow() {
			if (turn < 10) {
				var breakpoint = .5
				var target = 0;
				target = document.getElementById('arrow');
				if (target) {
					if (Math.random() <= breakpoint) {
						target.src = "assets/img/rightArrow.png"
					} else {
						target.src = "assets/img/leftArrow.png"
					}
					createdTime = Date.now();
				} else {
					stop();
				}
				timeoutID = window.setTimeout(betweenArrows, 2000);
				turn++;
			} else {
				stop();
				alert(JSON.stringify(responseTime));
				alert(JSON.stringify(rightAnswer));
			}
		}

		function clearTimer() {
			window.clearTimeout(timeoutID);
		}

		function stop() {
			testing = false;
			window.clearTimeout(timeoutID);
			document.getElementById('arrow').src = "assets/img/empty.png";
		}
	</script>

	<script type="text/javascript"
		src="http://ajax.googleapis.com/
ajax/libs/jquery/1.5/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$(".tab").click(function() {
				var X = $(this).attr('id');

				if (X == 'score') {
					$("#instruction").removeClass('select');
					$("#score").addClass('select');
					$("#instructionbox").slideUp();
					$("#scorebox").slideDown();
				} else {
					$("#score").removeClass('select');
					$("#instruction").addClass('select');
					$("#scorebox").slideUp();
					$("#instructionbox").slideDown();
				}

			});

		});
	</script>

	<script src="assets/js/chartist.min.js"></script>
</body>
</html>
