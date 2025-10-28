<!DOCTYPE html>
<html lang="es">

<head>
<!-- Bootstrap needs these two meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><@s.text name="admin.section.results"/></title>

<link rel="stylesheet" href="css/styles.css">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Bootstrap icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css"
	crossorigin="anonymous">

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>

<body onload="getUsersResults()">
	<!-- Bootstrap main container -->
	<div class="container-fluid">
	
		<!--  Navigation bar -->
		<#include "templates/navbar.ftl">

		<div class="row mt-4 ms-1 me-1 justify-content-center">
		
		<div class="col-2">
			<div class="list-group shadow">
				<@s.a action="adminConsole" class="list-group-item list-group-item-action active">
        			<i class="bi bi-card-list mx-2"></i> <@s.text name="admin.section.results"/>
				</@s.a>	
				<@s.a action="adminConsoleGroups" class="list-group-item list-group-item-action">
					<i class="bi bi-people-fill mx-2"></i> <@s.text name="admin.section.groups"/>
				</@s.a>	
				<@s.a action="adminConsoleUsers" class="list-group-item list-group-item-action">
					<i class="bi bi-person-fill mx-2"></i> <@s.text name="admin.section.users"/>
				</@s.a>
		  	</div>
		</div>
		
		<div class="col-10">

		<!--  Show messages / errors -->
		<#include "templates/show_messages.ftl">
		<#include "templates/show_errors.ftl">
					
			<@s.form action="adminDownloadResults" class="row border rounded-3 shadow pt-3 pb-3">					
				<div class="col-3">
					<div class="input-group">
					    <label for="exampleInputEmail1" class="input-group-text"><i class="bi bi-people-fill"></i></label>
						<select class="form-select" id="groupId" name="groupId" onChange="getUsersResults()">
						<@s.iterator value="groups">
							<option value='<@s.property value = "id"/>'><@s.property value = "name"/></option>
						</@s.iterator>
						</select>					
					</div>				
				</div>
				
				<div class="col-3">
					<div class="input-group">
					    <label for="exampleInputEmail1" class="input-group-text"><i class="bi bi-box"></i></label>
						<select class="form-select" id="moduleId" name="moduleId" onChange="getUsersResults()">
							<#include "templates/modules_select_options.ftl">
						</select>					
					</div>				
				</div>
				
				<div class="col-3">
					<div class="input-group">
					    <label for="exampleInputEmail1" class="input-group-text"><i class="bi bi-clock-fill"></i></label>
						<select class="form-select" id="timeLapse" name="timeLapse" onChange="getUsersResults()">
							<#include "templates/time_select_options.ftl">						
						</select>					
					</div>				
				</div>
				
				<div class="col-1 d-grid">
					<input type="checkbox" class="btn-check" id="btn-check-autorefresh" autocomplete="off" onclick="autoRefresh()">
					<label class="btn btn-outline-success" for="btn-check-autorefresh"><i id="img-autorefresh" class="bi bi-arrow-clockwise mx-2"></i> Auto</label>				
				</div>
				<div class="col-2 d-grid">
					
						<button class="btn btn-primary" type="submit">
							<i class="bi bi-file-earmark-arrow-down-fill mx-2"></i> <@s.text name="admin.results.downloadCSV"/>
						</button>
					
				</div>				
				</@s.form>
				
				<div class="row border rounded-3 shadow p-3 mt-3">
					<table class="table table-sm table-striped" id="resultsTable">
						<thead>
							<tr>
								<th class="w-25"><@s.text name="results.user"/></th>
								<th class="text-success w-15 text-center"><@s.text name="results.label.perfect"/></th>
								<th class="text-warning w-15 text-center"><@s.text name="results.label.ok"/></th>								
								<th class="text-danger w-15 text-center"><@s.text name="results.label.wrong"/></th>
								<th class="w-15 text-center"><@s.text name="results.label.total"/></th>
								<th class="w-15 text-center"><@s.text name="results.label.graph"/><th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
					
					<h3 class="text-center text-muted" id="emptyGroupLabel"><@s.text name="admin.results.label.empty"/></h3>
				</div>
				
			</div>

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

autoRefreshHandle = 0;

function getUsersResults() {
	ajaxRequestUserResults();
}

function ajaxRequestUserResults() {
	$.ajax({
		url: "jsonGetUserResults.action",
		success: loadTableData,
		data: {groupId: $("#groupId").val(), moduleId: $("#moduleId").val(), timeLapse: $("#timeLapse").val()}
	});
}

function loadTableData(jsonResult) {
	
	if (jsonResult.length == 0) {
		$("#resultsTable").hide();
		$("#emptyGroupLabel").show();
		return;
	}
	
	$("#resultsTable").show();
	$("#emptyGroupLabel").hide();
	
	tbody = $("#resultsTable").find('tbody');
	
	tbody.empty();
	
	$.each(jsonResult, function(i, item){
		
		total = item.results.right + item.results.wrong + item.results.nearly;
		
		rightPct = Math.round(100 * item.results.right / total);
		nearlyPct = Math.round(100 * item.results.nearly / total);		
		wrongPct = Math.round(100 * item.results.wrong / total);
		
		trHTML = '<tr>';
		trHTML += '<td>' + item.name + ' ' + item.surname + '</td>';

		if (total > 0) {
			trHTML += '<td class="text-center text-success">' + item.results.right + '</td>';
			trHTML += '<td class="text-center text-warning">' + item.results.nearly + '</td>';			
			trHTML += '<td class="text-center text-danger">' + item.results.wrong + '</td>';
			trHTML += '<td class="text-center">' + total + '</td>';			
			trHTML += '<td><div class="progress my-1">';
			trHTML += '<div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width:'+ rightPct +'%"></div>';
			trHTML += '<div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width:'+ nearlyPct +'%"></div>';
			trHTML += '<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width:'+ wrongPct +'%"></div>';
			trHTML += '</div></td>';
			trHTML += '</tr>';			
		} else {
			trHTML += '<td class="text-muted text-center" colspan="5"><@s.text name="admin.results.label.no.activity"/></td>';
		}

		tbody.append(trHTML);
		
	});		
}

function autoRefresh() {
	if ($("#btn-check-autorefresh").prop('checked')) {
		autoRefreshHandle = setInterval(getUsersResults, 5000);
		//$("#img-autorefresh").addClass("fa-spin");
	} else {
		clearInterval(autoRefreshHandle);
		//$("#img-autorefresh").removeClass("fa-spin");
	}
}
</script>

</html>
