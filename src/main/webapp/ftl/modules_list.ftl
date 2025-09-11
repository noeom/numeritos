<!DOCTYPE html>
<html lang="es">

<head>
<!-- Bootstrap needs these two meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><@s.text name="moduleList.title"/></title>

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
	
		<!--  Navigation bar -->
		<#include "templates/navbar.ftl">

		<div class="row justify-content-center">
		
		<!--  Show messages / errors -->
		<#include "templates/show_messages.ftl">
		<#include "templates/show_errors.ftl">
				
			<div class="col col-xl-6">

				<p class="lead mt-4">
					<@s.text name="moduleList.topMessage"/>
				</p>
				
				<div class="accordion mt-4 shadow" id="accordionBlocks">

					<div class="accordion-item">
						<!-- Naturals -->
						<div class="accordion-header" id="headingNaturals">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseNaturals"
								aria-expanded="false" aria-controls="collapseNaturals">
								<strong class="lead"><@s.text
									name="moduleList.category.naturals"/></strong>
							</button>
						</div>

						<div id="collapseNaturals" class="accordion-collapse collapse"
							aria-labelledby="headingNaturals"
							data-bs-parent="#accordionBlocks">
							<div class="accordion-body">
								<ul class="list-group">

									<li class="list-group-item text-center"><@s.a
										action="selectModule"> <@s.param name="moduleId" value="101"/>
										<@s.text name="moduleList.naturals.tables.title"/> </@s.a><br />
										<div class="text-muted fw-light"><@s.text
											name="moduleList.naturals.tables.desc"/></div>
									</li>

									<li class="list-group-item text-center"><@s.a
										action="selectModule"> <@s.param name="moduleId" value="102"/>
										<@s.text name="moduleList.naturals.simpleOps.title"/> </@s.a><br />
										<div class="text-muted fw-light"><@s.text
											name="moduleList.naturals.simpleOps.desc"/></div>
									</li>

									<li class="list-group-item text-center"><@s.a
										action="selectModule"> <@s.param name="moduleId" value="103"/>
										<@s.text name="moduleList.naturals.powers.title"/> </@s.a><br />
										<div class="text-muted fw-light"><@s.text
											name="moduleList.naturals.powers.desc"/></div>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="accordion-item"><!-- Integers -->
					<div class="accordion-header" id="headingIntegers">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#collapseIntegers"
							aria-expanded="false" aria-controls="collapseIntegers">
							<strong class="lead"><@s.text
								name="moduleList.category.integers"/></strong>
						</button>
					</div>
				
					<div id="collapseIntegers"
						class="accordion-collapse collapse"
						aria-labelledby="headingIntegers"
						data-bs-parent="#accordionBlocks">
						<div class="accordion-body">
							<ul class="list-group">
				
								<li class="list-group-item text-center"><@s.a
									action="selectModule"> <@s.param name="moduleId" value="201"/>
									<@s.text name="moduleList.integers.simpleOps.title"/>
									</@s.a><br />
									<div class="text-muted fw-light"><@s.text
										name="moduleList.integers.simpleOps.desc"/></div>
								</li>
								
								<li class="list-group-item text-center"><@s.a
									action="selectModule"> <@s.param name="moduleId" value="202"/>
									<@s.text name="moduleList.integers.powers.title"/>
									</@s.a><br />
									<div class="text-muted fw-light"><@s.text
										name="moduleList.integers.powers.desc"/></div>
								</li>								
							</ul>
						</div>
					</div>
				</div>
				
				<div class="accordion-item"><!-- Fractions --> 
					<div class="accordion-header" id="headingFractions">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#collapseFractions"
							aria-expanded="false" aria-controls="collapseFractions">
							<strong class="lead"><@s.text
								name="moduleList.category.fractions"/></strong>
						</button>
					</div>

					<div id="collapseFractions"
						class="accordion-collapse collapse"
						aria-labelledby="headingFractions"
						data-bs-parent="#accordionBlocks">
						<div class="accordion-body">
							<ul class="list-group">

								<li class="list-group-item text-center"><@s.a
									action="selectModule"> <@s.param name="moduleId" value="301"/>
									<@s.text name="moduleList.fractions.simpleOps.title"/>
									</@s.a><br />
									<div class="text-muted fw-light"><@s.text
										name="moduleList.fractions.simpleOps.desc"/></div>
								</li>
							</ul>
						</div>
					</div>
				</div>				

				<div class="accordion-item"><!-- Decimals -->
					<div class="accordion-header" id="headingDecimals">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#collapseDecimals"
							aria-expanded="false" aria-controls="collapseDecimals">
							<strong class="lead"><@s.text
								name="moduleList.category.decimals"/></strong>
						</button>
					</div>

					<div id="collapseDecimals"
						class="accordion-collapse collapse"
						aria-labelledby="headingDecimals"
						data-bs-parent="#accordionBlocks">
						<div class="accordion-body">
							<ul class="list-group">

								<li class="list-group-item text-center"><@s.a
									action="selectModule"> <@s.param name="moduleId" value="403"/>
									<@s.text name="moduleList.decimals.frac_gen.title"/>
									</@s.a><br />
									<div class="text-muted fw-light"><@s.text
										name="moduleList.decimals.frac_gen.desc"/></div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="accordion-item"><!-- Equations -->
					<div class="accordion-header" id="headingFirstDegEquations">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#collapseFirstDegEquations"
							aria-expanded="false" aria-controls="collapseFirstDegEquations">
							<strong class="lead"><@s.text
								name="moduleList.category.firstDegreeEquations"/></strong>
						</button>
					</div>

					<div id="collapseFirstDegEquations"
						class="accordion-collapse collapse"
						aria-labelledby="headingFirstDegEquations"
						data-bs-parent="#accordionBlocks">
						<div class="accordion-body">
							<ul class="list-group">

								<li class="list-group-item text-center"><@s.a
									action="selectModule"> <@s.param name="moduleId" value="501"/>
									<@s.text name="moduleList.first_deg_eq.direct.title"/>
									</@s.a><br />
									<div class="text-muted fw-light"><@s.text
										name="moduleList.first_deg_eq.direct.desc"/></div>
								</li>
								
								<li class="list-group-item text-center"><@s.a
									action="selectModule"> <@s.param name="moduleId" value="502"/>
									<@s.text name="moduleList.first_deg_eq.transposition.1.title"/>
									</@s.a><br />
									<div class="text-muted fw-light"><@s.text
										name="moduleList.first_deg_eq.transposition.1.desc"/></div>
								</li>
								
								<li class="list-group-item text-center"><@s.a
									action="selectModule"> <@s.param name="moduleId" value="503"/>
									<@s.text name="moduleList.first_deg_eq.transposition.2.title"/>
									</@s.a><br />
									<div class="text-muted fw-light"><@s.text
										name="moduleList.first_deg_eq.transposition.2.desc"/></div>
								</li>
								
								<li class="list-group-item text-center"><@s.a
									action="selectModule"> <@s.param name="moduleId" value="504"/>
									<@s.text name="moduleList.first_deg_eq.parenthesis.1.title"/>
									</@s.a><br />
									<div class="text-muted fw-light"><@s.text
										name="moduleList.first_deg_eq.parenthesis.1.desc"/></div>
								</li>
								
								<li class="list-group-item text-center"><@s.a
									action="selectModule"> <@s.param name="moduleId" value="505"/>
									<@s.text name="moduleList.first_deg_eq.parenthesis.2.title"/>
									</@s.a><br />
									<div class="text-muted fw-light"><@s.text
										name="moduleList.first_deg_eq.parenthesis.2.desc"/></div>
								</li>																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							
							</ul>
						</div>
					</div>
				</div>

				</div> <!-- accordion -->				
				
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
