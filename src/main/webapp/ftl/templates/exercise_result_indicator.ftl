<#switch Request.resultCode>

	<#case 1>
		<h1 class="text-success"><i class="fa-regular fa-circle-check"></i> <@s.text name="results.label.perfect"/></h1>
	<#break>
	
	<#case 0>
		<h1 class="text-danger"><i class="fa-regular fa-circle-xmark"></i> <@s.text name="results.label.wrong"/></h1>				
	<#break>
		
	<#default>
		<h1 class="text-warning"><i class="fa-solid fa-triangle-exclamation"></i> <@s.text name="results.label.ok"/></h1>
</#switch>