<!DOCTYPE html>
<html lang="es">

<head>
<!-- Bootstrap needs these two meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><@s.text name="stats.title"/></title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Bootstrap icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css"
	crossorigin="anonymous">
	
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	

</head>

<body onLoad="refreshTable()">
	<!-- Bootstrap main container -->
	<div class="container">
	
		<!--  Navigation bar -->
		<#include "templates/navbar.ftl">

		<div class="row justify-content-center">
		
		<!--  Show messages / errors -->
		<#include "templates/show_messages.ftl">
		<#include "templates/show_errors.ftl">
				
			<div class="col">

				<p class="display-6 text-center mt-3">
					<@s.text name="stats.topMessage"/>
				</p>

			</div>
			
			<div class="row border rounded-3 shadow pt-3 pb-3">
							
				<div class="col-12 col-md-6 my-2">
					<div class="input-group">
					    <label for="exampleInputEmail1" class="input-group-text"><i class="bi bi-box"></i></label>
						<select class="form-select" aria-label="Default select example" onchange="refreshTable()" id="moduleId">
						  <#include "templates/modules_select_options.ftl">
						</select>					
					</div>				
				</div>

				<div class="col-12 col-md-6 my-2">				
					<div class="input-group">
					    <label for="exampleInputEmail1" class="input-group-text"><i class="bi bi-clock-fill"></i></label>
						<select class="form-select" id="timeLapse" name="timeLapse" onChange="refreshTable()">
							<#include "templates/time_select_options.ftl">
						</select>					
					</div>
				</div>					
			</div>
			
			<div class="row border rounded-3 shadow mt-3">
				<table class="table">
					<tr class="text-center">
						<th class="text-success w-25"><@s.text name="results.label.perfect"/></th>
						<th class="text-warning w-25"><@s.text name="results.label.ok"/></th>
						<th class="text-danger w-25"><@s.text name="results.label.wrong"/></th>
						<!-- <th class="w-auto">Total</th> -->
						<th class="w-25"><@s.text name="results.label.graph"/></th>
					</tr>
					<tr class="text-center">
						<td class="text-success" id="tdRight"></td>
						<td class="text-warning" id="tdSoso"></td>
						<td class="text-danger" id="tdWrong"></td>
						<td id="tdTotal" hidden></td>
						<td id="tdProgress"></td>
					</tr>					
				</table>
			</div>

		</div>
	</div>
</body>

<!-- Bootstrap JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script>

function refreshTable() {
	ajaxRequestData();	
}

function loadTableData(jsonResult) {
	
	total = jsonResult.right + jsonResult.nearly + jsonResult.wrong;
	
	rightPct = Math.round(100 * jsonResult.right / total);
	wrongPct = Math.round(100 * jsonResult.wrong / total);
	sosoPct = Math.round(100 * jsonResult.nearly / total);
	
	$('#tdRight').html(jsonResult.right);
	$('#tdSoso').html(jsonResult.nearly);	 
	$('#tdWrong').html(jsonResult.wrong);
	$('#tdTotal').html(total);
    if (total > 0) {
        $('#tdRight').append('<span class="text-secondary"> (' + (100 * jsonResult.right / total).toFixed(1) + '%)');
        $('#tdSoso').append('<span class="text-secondary"> (' + (100 * jsonResult.wrong / total).toFixed(1) + '%)');
        $('#tdWrong').append('<span class="text-secondary"> (' + (100 * jsonResult.nearly / total).toFixed(1) + '%)');
    }
	$('#tdProgress').empty();
	 
	trHTML = '<div class="progress m-2">';
	trHTML += '<div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width:'+ rightPct +'%"></div>';
	trHTML += '<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width:'+ sosoPct +'%"></div>';	
	trHTML += '<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width:'+ wrongPct +'%"></div>';
	trHTML += '</div>';
	
	$('#tdProgress').append(trHTML);
}

function ajaxRequestData() {
	$.ajax({
		url: "jsonUserStats.action",
		success: loadTableData,
		data: {moduleId: $("#moduleId").val(), timeLapse: $("#timeLapse").val()}
	});	
}
</script>

</html>
