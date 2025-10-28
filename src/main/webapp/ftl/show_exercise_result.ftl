<!DOCTYPE html>
<html lang="es">

<head>
	<!-- Bootstrap needs these two meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title><@s.text name="exercise.view.title"/></title>
	
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
	
	<!-- Mathjax -->
	<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
	<script id="MathJax-script" async
	        src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
	</script>	
	
</head>

<body>
	<!-- Bootstrap main container -->
	<div class="container">
	
		<!--  Navigation bar -->
		<#include "templates/navbar.ftl">
		
		<div class="row justify-content-center">
		
			<div class="col col-xl-6">

				<div class="card mt-5 shadow">
					<div class="card-body text-center">


					<!-- Result banner -->
					<#include "templates/exercise_result_indicator.ftl">
					
					<!-- Show result -->
					<#include "templates/operation_result.ftl">
							
    				<!-- Answer submit form -->
    				<div class="text-center mt-4">
						<@s.form action="exerciseLoad">
							<button type="submit" class="btn btn-primary" autofocus><@s.text name="results.label.keep.going"/> <i class="bi bi-arrow-right-circle-fill" title="Continuar"></i></button>
						</@s.form>
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
