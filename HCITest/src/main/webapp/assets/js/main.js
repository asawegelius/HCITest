/**
 * 
 */
function nextPage(address){
	document.forms.navbar.address.value=address;
	document.forms.navbar.action = "ResultServlet";
	document.forms.navbar.method = "post"; // "get"
	document.forms.navbar.submit();
}

