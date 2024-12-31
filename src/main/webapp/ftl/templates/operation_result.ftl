<#switch Request.exercise.type>

	<#case 501> <!-- 1st degree transposition equation -->
		<#include "results/first_degree_equation.ftl">
	<#break>
	
	<#case 301> <!-- simple fractions operation -->
		<#include "results/fraction_operation.ftl">	
	<#break>
	
	<#case 403> <!-- simple fractions operation -->
		<#include "results/fraction_operation.ftl">	
	<#break>		
	
	<#default> <!-- Simple operation -->
		<#include "results/simple_operation.ftl">
	<#break>
			
</#switch>

