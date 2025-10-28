<!DOCTYPE html>
<html lang="es">

<head>
<!-- Bootstrap needs these two meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><@s.text name="admin.section.users"/></title>

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

<body onload="ajaxLoadTable()">
	<!-- Bootstrap main container -->
	<div class="container-fluid">
	
		<!--  Navigation bar -->
		<#include "templates/navbar.ftl">

		<div class="row mt-4 ms-1 me-1 justify-content-center">
		
		<div class="col-2">
			<div class="list-group shadow">
				<@s.a action="adminConsole" class="list-group-item list-group-item-action">
        			<i class="bi bi-card-list mx-2"></i> <@s.text name="admin.section.results"/>
				</@s.a>	
				<@s.a action="adminConsoleGroups" class="list-group-item list-group-item-action">
					<i class="bi bi-people-fill mx-2"></i> <@s.text name="admin.section.groups"/>
				</@s.a>	
				<@s.a action="adminConsoleUsers" class="list-group-item list-group-item-action active">
					<i class="bi bi-person-fill mx-2"></i> <@s.text name="admin.section.users"/>
				</@s.a>
		  	</div>
		</div>
		
		<div class="col-10">

		<!--  Show messages / errors -->
		<#include "templates/show_messages.ftl">
		<#include "templates/show_errors.ftl">
					
			<div class="row border rounded-3 shadow pt-3 pb-3">
				<div class="col-4">
					<div class="input-group">
					    <label for="exampleInputEmail1" class="input-group-text"><i class="bi bi-people-fill"></i></label>
						<select class="form-select" aria-label="Default select example" onchange="ajaxLoadTable()" id="groupSelect">
						<@s.iterator value="groups">
							<option value='<@s.property value = "id"/>'><@s.property value = "name"/></option>
						</@s.iterator>
						</select>					
					</div>				
				</div>			
			</div>
				
			<div class="row border rounded-3 shadow p-3 mt-3">
				
				<table class="table table-sm table-striped" id="usersTable" style="display:none">
					<thead>
						<tr>
							<th><@s.text name="admin.users.name"/></th>
							<th><@s.text name="admin.users.surname"/></th>
							<th><@s.text name="admin.users.email"/></th>
							<th><@s.text name="admin.users.password.reset"/></th>
							<th><@s.text name="admin.users.group.change"/></th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				
				<h3 class="text-center text-muted" id="emptyGroupLabel" style="display:none"><@s.text name="admin.results.label.empty"/></h3>
				
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
function ajaxLoadTable() {
	$.ajax({
		url: "jsonAdminUsers.action",
		success: loadTableData,
		data: {groupId: $("#groupSelect").val()}
	});
}

function loadTableData(jsonResult) {
	
	if (jsonResult.length == 0) {
		$("#usersTable").hide();
		$("#emptyGroupLabel").show();
		return;
	}
	
	$("#usersTable").show();
	$("#emptyGroupLabel").hide();
	
	tbody = $("#usersTable").find('tbody');
	
	tbody.empty();
	
	$.each(jsonResult, function(i, item){
		
		selectId = 'selecStudent' + item.id;
		
		trHTML = '<tr><td class="align-middle">' + item.name + '</td><td class="align-middle">' + item.surname + '</td><td class="align-middle">' + item.email + '</td>';
		trHTML += '<td class="align-middle"><button class="btn btn-warning me-2" onclick="passwordResetRequest('+ item.id +', \''+ item.name + '\')"><i class="bi bi-arrow-clockwise mx-1"></i><i class="bi bi-lock-fill mx-1"></i>1234abcd</button></td>';
		trHTML += '<td class="align-middle"><div class="input-group"><label class="input-group-text"><i class="bi bi-people-fill"></i></label>';
		trHTML += '<select class="form-select" onchange="changeGroup('+item.id+')" id="' + selectId +'">';	
		trHTML += $("#groupSelect").clone().html();
		trHTML += '</select></div></td>'
		trHTML += '</tr>';
		tbody.append(trHTML);
		
		$("#"+selectId).val($("#groupSelect").val());
	});	
}

function changeGroup(userId) {
	groupId = $("#selecStudent"+userId).val();
	ajaxChangeGroup(userId, groupId);
}

function ajaxChangeGroup(userId, groupId) {
	$.ajax({
		url: "jsonChangeUserGroup.action",
		success: ajaxLoadTable,
		data: {userId: userId, groupId: groupId}
	});	
}

function passwordResetRequest(userId, name) {
	if (window.confirm('<@s.text name="admin.users.password.reset.ask"/>'.replace("{0}", name))) {
		ajaxResetPassword(userId);
	}
}

function ajaxResetPassword(userId) {
	$.ajax({
		url: "jsonResetPassword.action",
		success: confirmPasswordReset,
		data: {userId: userId}
	});
}

function confirmPasswordReset(jsonResult) {
	alert('<@s.text name="admin.users.password.reset.confirmation"/>')
}

</script>

</html>
