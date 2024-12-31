<!DOCTYPE html>
<html lang="es">

<head>
<!-- Bootstrap needs these two meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><@s.text name="login.title"/></title>

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
	<div class="container">

		<!-- Title -->
		<div class="row">
			<div class="col">
				<h1 class="text-primary text-center mt-3">numeritos.net</h1>
			</div>
		</div>
		
		<!--  Show messages and errors -->
		<#include "templates/show_errors.ftl">
		<#include "templates/show_messages.ftl">		
		
		<!-- Login form -->
		<div class="row justify-content-center">
			<div class="col-10 col-md-8 col-lg-6 col-xl-4 col-xxl-4">
				<@s.form action="login" class="border rounded ps-3 pe-3 shadow mt-3">

				<!-- Email textbox -->
				<div class="input-group my-3">
					<span class="input-group-text" id="basic-addon1"><i
						class="fa-solid fa-envelope"></i></span> <input type="email" name="email"
						class="form-control" placeholder="<@s.text name='label.email'/>"
						autofocus required>
				</div>

				<!-- Password textbox -->
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-key"></i></span>
					<input type="password" name="password" class="form-control" placeholder="<@s.text name='label.password'/>"
					required>
				</div>

				<!-- Submit button -->
				<div class="d-grid mb-3">
					<button type="submit" class="btn btn-primary"><@s.text name='label.login'/></button>
				</div>

				</@s.form>
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
