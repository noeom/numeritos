<#switch Request.exercise.type>

	<#on 501, 502, 503, 504, 505> <!-- 1st degree equation -->
		<#include "results/first_degree_equation.ftl">
	
	<#on 301,403> <!-- simple fractions operation -->
		<#include "results/fraction_operation.ftl">	
	
	<#default> <!-- Simple operation -->
		<#include "results/simple_operation.ftl">
			
</#switch>

