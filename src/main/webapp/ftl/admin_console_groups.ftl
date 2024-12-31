<!DOCTYPE html>
<html lang="es">

<head>
<!-- Bootstrap needs these two meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><@s.text name="admin.section.groups"/></title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Font awesome icons -->
<script src="https://kit.fontawesome.com/c44605b5df.js"
	crossorigin="anonymous"></script>

</head>

<body>
	<!-- Bootstrap main container -->
	<div class="container-fluid">
	
		<!--  Navigation bar -->
		<#include "templates/navbar.ftl">

		<div class="row mt-4 ms-1 me-1 justify-content-center">
		
		<div class="col-2">
			<div class="list-group shadow">
				<@s.a action="adminConsole" class="list-group-item list-group-item-action">
        			<i class="fa-solid fa-table-list mx-2"></i> <@s.text name="admin.section.results"/>
				</@s.a>	
				<@s.a action="adminConsoleGroups" class="list-group-item list-group-item-action active">
					<i class="fa-solid fa-users mx-2"></i> <@s.text name="admin.section.groups"/>
				</@s.a>	
				<@s.a action="adminConsoleUsers" class="list-group-item list-group-item-action">
					<i class="fa-solid fa-user mx-2"></i> <@s.text name="admin.section.users"/>
				</@s.a>
		  	</div>
		</div>
		
		<div class="col-10">

		<!--  Show messages / errors -->
		<#include "templates/show_messages.ftl">
		<#include "templates/show_errors.ftl">
					
			<@s.form action="adminCreateGroup" class="row border rounded-3 shadow pt-3 pb-3">
				<div class="col">
					<div class="input-group">
						<input type="text" class="form-control" placeholder='<@s.text name="admin.groups.placeholder.groupname"/>' name="groupName" required>
						<button class="btn btn-primary" type="submit">
					    	<i class="fa-solid fa-plus fa-xl mx-2"></i> <@s.text name="admin.groups.create"/>
					    </button>
					</div>		
				</div>

			</@s.form>
				
				<div class="row border rounded-3 shadow p-3 mt-3">
					<table class="table table-striped table-sm" id="resultsTable">
						<thead>
							<tr>
								<th><@s.text name="admin.groups.table.name"/></th>
								<th><@s.text name="admin.groups.table.size"/></th>
								<th><@s.text name="admin.groups.table.actions"/></th>
							</tr>
						</thead>
						<tbody>
							<@s.iterator value="groups">
							    <tr>
							    	<td>
							    		<@s.property value = "name"/>
							    	</td>
							    	
							    	<td>
							    		<@s.property value = "size"/>
							    	</td>
							    	
							    	<td>
							    		<@s.if test="size==0">
							    			<@s.form action="adminDeleteGroup">
							    			<input type="hidden" name="groupId" value='<@s.property value = "id"/>'>
							    			<button class="btn btn-danger btn-sm" type="submit"><i class="fa-solid fa-trash-can mx-2"></i> <@s.text name="admin.groups.table.delete"/></button>
							    			</@s.form>
							    		</@s.if>
							    		<@s.else>
							    			<button class="btn btn-sm btn-outline-secondary disabled"><i class="fa-solid fa-trash-can mx-2"></i> <@s.text name="admin.groups.table.delete"/></button>
							    		</@s.else>
							    	</td>
							    </tr>
							</@s.iterator>						

						</tbody>
					</table>
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

</html>
