/**
 * 
 */
var clickedTime;
var createdTime;
var reactionTime;
var timeoutID;
var turn = 0;
var testing = false;
var respTime = [ -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1 ];
var rightAnswer = [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ];
var respTime2 = [ -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1 ];
var rightAnswer2 = [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ];
window.addEventListener("keydown", checkKeyPressed, false);

function checkKeyPressed(e) {
	if (testing) {
		switch (e.keyCode) {
		case 37:
			clickedTime = Date.now();
			var img = document.getElementById('arrow');
			if (turn < 11) {
				if (img.src.indexOf('leftArrow.png') > -1
						&& rightAnswer[turn - 1] < 0) {
					rightAnswer[turn - 1] = 1;} else {
					rightAnswer[turn - 1] = 0;
				}
				reactionTime = (clickedTime - createdTime) / 1000;
				respTime[turn - 1] = reactionTime;
			} else {
				if (img.src.indexOf('leftArrow.png') > -1
						&& rightAnswer2[turn - 11] < 0) {
					rightAnswer2[turn - 11] = 1;
				} else {
					rightAnswer2[turn - 11] = 0;
				}
				reactionTime = (clickedTime - createdTime) / 1000;
				respTime2[turn - 11] = reactionTime;
			}
			break;
		case 39:
			clickedTime = Date.now();
			var img = document.getElementById('arrow');
			if (turn < 11) {
				if (img.src.indexOf('rightArrow.png') > -1
						&& rightAnswer[turn - 1] < 0) {
					rightAnswer[turn - 1] = 1;
				} else {
					rightAnswer[turn - 1] = 0;
				}
				reactionTime = (clickedTime - createdTime) / 1000;
				respTime[turn - 1] = reactionTime;
			} else {
				if (img.src.indexOf('rightArrow.png') > -1
						&& rightAnswer2[turn - 11] < 0) {
					rightAnswer2[turn - 11] = 1;
				} else {
					rightAnswer2[turn - 11] = 0;
				}
				reactionTime = (clickedTime - createdTime) / 1000;
				respTime2[turn - 11] = reactionTime;
			}
			break;
		default:
			clickedTime = Date.now();
			reactionTime = (clickedTime - createdTime) / 1000;
			if (turn < 10) {
				respTime[turn - 1] = reactionTime;
			} else {
				respTime2[turn - 11] = reactionTime;
			}
			break;
		}
	}
}

function showArrows() {
	createdTime = Date.now();
	testing = true;
	timeoutID = window.setTimeout(randomArrow, 500);
}

function betweenArrows() {
	document.getElementById('arrow').src = "assets/img/empty.png"
	timeoutID = window.setTimeout(randomArrow, 500);
}

function randomArrow() {
	if (turn < 20) {
		if (turn == 10) {
			var image = document.getElementById('distraction');
			image.src = "assets/img/pulsating.gif";
		}
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
		timeoutID = window.setTimeout(betweenArrows, 500);
		turn++;
	} else {
		stop();

		document.forms.navbar.responseTime.value = JSON.stringify(respTime);
		document.forms.navbar.responseTimeDistracted.value = JSON.stringify(respTime2);
		document.forms.navbar.rightAnswer.value = JSON.stringify(rightAnswer);
		document.forms.navbar.rightAnswerDistracted.value = JSON.stringify(rightAnswer2);
		document.forms.navbar.address.value="result";
		document.forms.navbar.action = "ResultServlet";
		document.forms.navbar.method = "post"; // "get"		
		document.forms.navbar.submit();
	}
}

function clearTimer() {
	window.clearTimeout(timeoutID);
}

function start() {
	respTime = [ -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1 ];
	rightAnswer = [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ];
	respTime2 = [ -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1 ];
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