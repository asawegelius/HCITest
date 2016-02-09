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
							<img id="distraction" src="assets/img/empty.png" alt="red spot" />
						</div>
						<div class="arrow">
							<img id="arrow" src="assets/img/empty.png" alt="left arrow" />
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<input id="tab1" type="radio" name="tabs" checked> <label
						for="tab1">Instruction</label> <input id="tab2" type="radio"
						name="tabs"> <label for="tab2">Score</label>
					<div class="content">
						<div id="content1">
							<ul class="text-left">
								<li>The test takes max 3 minutes</li>
								<li>You shall press the left arrow key when the left arrow
									appears</li>
								<li>You shall press the right arrow key when the right
									arrow appears</li>
								<li>It is your first click that counts</li>
							</ul>
						</div>

						<div id="content2">
							<ul class="text-left">
								<li>The result will be here after you have taken the test</li>
								<li>Start the test by clicking the green start test button</li>
								<li>Check here after the test is completed</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="pull-right">
					<button type="button" class="btn btn-success" onclick="start()">Start
						test</button>
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
	<script>
		new Chartist.Bar('.ct-chart', {
			labels : [ '1', '2', '3', '4', '5', '6', '7' ],
			series : [ 20, 60, 120, 200, 180, 20, 10 ]
		}, {
			distributeSeries : true
		});
	</script>
	<script type="text/javascript">
		var clickedTime;
		var createdTime;
		var reactionTime;
		var timeoutID;
		var turn = 0;
		var testing = false;
		var responseTime = [ -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1,
				-0.1, -0.1 ];
		var rightAnswer = [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ];
		var responseTime2 = [ -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1,
				-0.1, -0.1 ];
		var rightAnswer2 = [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ];
		window.addEventListener("keydown", checkKeyPressed, false);

		function checkKeyPressed(e) {
			if (testing) {
				switch (e.keyCode) {
				case 37:
					clickedTime = Date.now();
					var img = document.getElementById('arrow');
					if (turn < 10) {
						if (img.src.indexOf('leftArrow.png') > -1
								&& rightAnswer[turn - 1] < 0) {
							rightAnswer[turn - 1] = 1;
						} else {
							rightAnswer[turn - 1] = 0;
						}
						reactionTime = (clickedTime - createdTime) / 1000;
						responseTime[turn - 1] = reactionTime;
					} else {
						if (img.src.indexOf('leftArrow.png') > -1
								&& rightAnswer2[turn - 11] < 0) {
							rightAnswer2[turn - 11] = 1;
						} else {
							rightAnswer2[turn - 11] = 0;
						}
						reactionTime = (clickedTime - createdTime) / 1000;
						responseTime2[turn - 11] = reactionTime;
					}
					break;
				case 39:
					clickedTime = Date.now();
					var img = document.getElementById('arrow');
					if (turn < 10) {
						if (img.src.indexOf('rightArrow.png') > -1
								&& rightAnswer[turn - 1] < 0) {
							rightAnswer[turn - 1] = 1;
						} else {
							rightAnswer[turn - 1] = 0;
						}
						reactionTime = (clickedTime - createdTime) / 1000;
						responseTime[turn - 1] = reactionTime;
					} else {
						if (img.src.indexOf('rightArrow.png') > -1
								&& rightAnswer2[turn - 11] < 0) {
							rightAnswer2[turn - 11] = 1;
						} else {
							rightAnswer2[turn - 11] = 0;
						}
						reactionTime = (clickedTime - createdTime) / 1000;
						responseTime2[turn - 11] = reactionTime;
					}
					break;
				default:
					clickedTime = Date.now();
					reactionTime = (clickedTime - createdTime) / 1000;
					if (turn < 10) {
						responseTime[turn - 1] = reactionTime;
					} else {
						responseTime2[turn - 11] = reactionTime;
					}
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
			if (turn == 10) {
				var image = document.getElementById('distraction');
				image.src = "assets/img/distraction2.gif";
			}
			if (turn < 20) {
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
				radiobtn = document.getElementById("tab2");
				radiobtn.checked = true;
				var displayChart = document.getElementById("content2")
				displayChart.innerHTML = "<div class='ct-chart ct-golden-section' id='chart1'></div>"
						+ "<div class='ct-chart ct-golden-section' id='chart2'></div>"
						+ "<div class='ct-chart ct-golden-section' id='chart3'></div>"
						+ "<div class='ct-chart ct-golden-section' id='chart4'></div>";
				new Chartist.Bar('#chart1', {
					labels : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
							'10' ],
					series : [ [ {
						meta : rightAnswer[0],
						value : responseTime[0]
					}, {
						meta : rightAnswer[1],
						value : responseTime[1]
					}, {
						meta : rightAnswer[2],
						value : responseTime[2]
					}, {
						meta : rightAnswer[3],
						value : responseTime[3]
					}, {
						meta : rightAnswer[4],
						value : responseTime[4]
					}, {
						meta : rightAnswer[5],
						value : responseTime[5]
					}, {
						meta : rightAnswer[6],
						value : responseTime[6]
					}, {
						meta : rightAnswer[7],
						value : responseTime[7]
					}, {
						meta : rightAnswer[8],
						value : responseTime[8]
					}, {
						meta : rightAnswer[9],
						value : responseTime[9]
					} ] ]
				});

				var right = 0;
				var wrong = 0;
				var miss = 0;
				for ( var i in rightAnswer) {
					if (rightAnswer[i] == 1)
						right++;
					else if (rightAnswer[i] == 0)
						wrong++;
					else
						miss++;
				}

				new Chartist.Pie('#chart2', {
					series : [ {
						value : right,
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
				});

				new Chartist.Bar('#chart3', {
					labels : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
							'10' ],
					series : [ [ {
						meta : rightAnswer2[0],
						value : responseTime2[0]
					}, {
						meta : rightAnswer2[1],
						value : responseTime2[1]
					}, {
						meta : rightAnswer2[2],
						value : responseTime2[2]
					}, {
						meta : rightAnswer2[3],
						value : responseTime2[3]
					}, {
						meta : rightAnswer2[4],
						value : responseTime2[4]
					}, {
						meta : rightAnswer2[5],
						value : responseTime2[5]
					}, {
						meta : rightAnswer2[6],
						value : responseTime2[6]
					}, {
						meta : rightAnswer2[7],
						value : responseTime2[7]
					}, {
						meta : rightAnswer2[8],
						value : responseTime2[8]
					}, {
						meta : rightAnswer2[9],
						value : responseTime2[9]
					} ] ]
				});

				var right = 0;
				var wrong = 0;
				var miss = 0;
				for ( var i in rightAnswer) {
					if (rightAnswer2[i] == 1)
						right++;
					else if (rightAnswer2[i] == 0)
						wrong++;
					else
						miss++;
				}

				new Chartist.Pie('#chart4', {
					series : [ {
						value : right,
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
				});
			}
		}

		function clearTimer() {
			window.clearTimeout(timeoutID);
		}

		function start() {
			responseTime = [ -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1,
					-0.1, -0.1 ];
			rightAnswer = [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ];
			responseTime2 = [ -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1,
					-0.1, -0.1 ];
			rightAnswer2 = [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ];
			turn = 0;
			showArrows();
		}

		function stop() {
			testing = false;
			window.clearTimeout(timeoutID);
			document.getElementById('arrow').src = "assets/img/empty.png";
			document.getElementById('distraction').src = "assets/img/empty.png";
		}
	</script>

</body>
</html>
