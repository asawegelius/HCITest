				var optionsBar = {
					width : "18.45em",
					height : "17.75em"
				}

				var optionsPie = {
					width : "18.45em",
					height : "17.45em",
				}

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
				}, optionsBar);

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
				}, optionsPie);

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
				}, optionsBar);

				var right = 0;
				var wrong = 0;
				var miss = 0;
				for ( var i in rightAnswer2) {
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
				}, optionsPie);/**
 * 
 */