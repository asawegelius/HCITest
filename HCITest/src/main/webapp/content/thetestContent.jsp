<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
<!--
	var d = document.getElementById("thetest");
	d.className += "active";
//-->
</script>
<!-- container -->
<div class="container">
	<div class="starter-template" class="test-screen">
		<div class="test-screen">
			<div class="page-heading">
				<h2 class="panel-title pull-left">The test</h2>

				<button type="button" class="btn btn-success pull-right"
					onclick="start()">Start test</button>
				<div class="clearfix"></div>
			</div>
			<div class="page-content">
				<div class="red-spot">
					<img id="distraction" src="assets/img/empty.png" alt="red spot" />
				</div>
				<div class="arrow">
					<img id="arrow" src="assets/img/empty.png" height="100" width="100"
						alt="left arrow" />
				</div>

			</div>
		</div>
	</div>
</div>
<!-- /.container -->