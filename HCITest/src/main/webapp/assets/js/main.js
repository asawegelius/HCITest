/**
 * 
 */
function nextPage(address){
	document.forms[0].responseTime.value = responseTime;
	document.forms[0].responseTime2.value = responseTime2;
	document.forms[0].rightAnswer.value = rightAnswer;
	document.forms[0].rightAnswer2.value = rightAnswer2;
	document.forms[0].address.value=address;
	document.forms[0].action = "ResultServlet";
	document.forms[0].method = "post"; // "get"
	document.forms[0].submit();
}