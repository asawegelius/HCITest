function showCharts() {
	var optionsBar = {
			width : "18.45em",
			height : "17.75em"
		};

		var optionsPie = {
			width : "18.45em",
			height : "17.45em"
		};

		new Chartist.Bar('#chart1', {
			labels : [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10' ],
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

		var rightvar = 0;
		var wrong = 0;
		var miss = 0;
		for ( var i in right) {
			if (right[i] == 1){
				rightvar++;
}
			else if (right[i] === 0){
				wrong++;
}
			else{
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
			labels : [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10' ],
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

		rightvar = 0;
		wrong = 0;
		miss = 0;
i = 0;
		for (i in rightDistracted) {
			if (rightAnswer2[i] == 1){
				rightvar++;
}
			else if (rightDistracted[i] === 0){
				wrong++;
}
			else{
				miss++;
}
		}

		new Chartist.Pie('#chart4', {
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
}