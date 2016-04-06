<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.reflect.Type"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.stream.Collectors"%>

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
<%if (request.getParameter("rightAnswer") == null) {
				List<Integer> rightList = Arrays.asList(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1);%>
	document.forms.navbar.namedItem("responseTime").value = JSON
				.stringify([ -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1,
						-0.1, -0.1 ]);
		document.forms.navbar.namedItem("rightAnswer").value = JSON.stringify([
				-1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ]);
		document.forms.navbar.namedItem("responseTimeDistracted").value = JSON
				.stringify([ -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1,
						-0.1, -0.1 ]);
		document.forms.navbar.namedItem("rightAnswerDistracted").value = JSON
				.stringify([ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ]);
<%// End of if
			} else {
				Type listTypeInt = new TypeToken<List<Integer>>() {
				}.getType();
				List<Integer> rightList = new Gson().fromJson(request.getParameter("rightAnswer"), listTypeInt);%>
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
