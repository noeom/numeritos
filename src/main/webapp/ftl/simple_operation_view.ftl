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
	
	<!-- Font awesome icons -->
	<script src="https://kit.fontawesome.com/c44605b5df.js"	crossorigin="anonymous"></script>
	
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
					<div class="card-body">
					
					<!-- Exercise id -->
					<@s.hidden name="exerciseId" value="%{exercise.id}"/>
					
					<!-- Exercise statement (text) -->
					<p class="lead">
						<@s.text name="exercise.view.calculate"/>
					</p>
					
					<!-- Exercise statement (maths) -->
					<p class="mb-4 mt-4">
						$$ \Large{ <@s.property value="exercise.statement"/> } $$
 					</p>
    
    				<!-- Answer submit form -->
    				<@s.form action="exerciseCheck">
						<div class="input-group mt-3">
							<span class="input-group-text"><i class="fa-solid fa-pen"></i></span>
							<input type="number" name="answer" class="form-control" autofocus>
							<button type="submit" class="btn btn-primary"><i class="fa-solid fa-check" title='<@s.text name="exercise.view.check.solution"/>'></i></button>
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
