<#switch Request.resultCode>

	<#case 1>
		<h1 class="text-success"><i class="bi bi-check-circle"></i> <@s.text name="results.label.perfect"/></h1>
	<#break>
	
	<#case 0>
		<h1 class="text-danger"><i class="bi bi-x-circle"></i> <@s.text name="results.label.wrong"/></h1>				
	<#break>
		
	<#default>
		<h1 class="text-warning"><i class="bi bi-exclamation-triangle"></i> <@s.text name="results.label.ok"/></h1>
</#switch>