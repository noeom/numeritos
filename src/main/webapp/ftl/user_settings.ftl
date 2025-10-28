<!DOCTYPE html>
<html lang="es">

<head>
<!-- Bootstrap needs these two meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><@s.text name="userSettings.title"/></title>

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

</head>

<body>
	<!-- Bootstrap main container -->
	<div class="container">
	
		<!--  Navigation bar -->
		<#include "templates/navbar.ftl">

		<div class="row justify-content-center">
		
		<!--  Show messages / errors -->
		<#include "templates/show_messages.ftl">
		<#include "templates/show_errors.ftl">
				
			<div class="col col-xl-6">

				<div class="card mt-4 shadow">
				
					<div class="card-header text-center">
						<i class="bi bi-info-circle-fill h3"></i>
						<@s.text name="userSettings.userInfo.title"/>
					</div>
					
					<div class="card-body text-center">
					
						<h5 class="card-title text-center">
							<@s.property value="#session['user'].name"/> <@s.property value="#session['user'].surname"/></h5>
							
						<h6 class="card-title text-center text-muted">
							<@s.property value="#session['user'].email"/>
						</h6>
										
						<hr/>
	
						<p class="card-text">
							<i class="bi bi-building h3"></i>
							<@s.property value="userGroup.organization.name"/>
						</p>
												
						<p class="card-text">
							<i class="bi bi-people-fill h3"></i>
								<@s.property value="userGroup.name"/>
						</p>			
						
					</div>
				</div>

				<div class="card mt-4 shadow">
					<div class="card-header text-center">
						<i class="bi bi-shield-shaded h3"></i> <@s.text name="userSettings.security.title"/>
					</div>
							<@s.form action="changePassword" class="card-body">
							
							<!-- Old password textbox -->
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1"><i	class="bi bi-key-fill"></i></span>
								<input type="password" name="oldPassword" class="form-control" placeholder="<@s.text name='userSettings.security.oldpwd.placeholder'/>" aria-label="<@s.text name='userSettings.security.oldpwd.placeholder'/>" aria-describedby="basic-addon1" required>
							</div>

							<!-- New password textbox -->
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1"><i	class="bi bi-key-fill"></i></span>
								<input type="password" name="newPassword" class="form-control" placeholder="<@s.text name='userSettings.security.newpwd.placeholder'/>" aria-label="<@s.text name='userSettings.security.newpwd.placeholder'/>" aria-describedby="basic-addon1" required>
							</div>
			
							<!-- Submit button -->
							<div class="d-grid mb-3">
								<button type="submit" class="btn btn-primary"><@s.text name="userSettings.security.submit"/></button>
							</div>
			
							</@s.form>
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
