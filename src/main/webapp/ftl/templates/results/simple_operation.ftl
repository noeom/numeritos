<#switch Request.resultCode>

	<#case 1>
		$$ \Large{ ${Request.exercise.statement} = ${Request.exercise.solution} }$$
	<#break>
	
	<#case 0>
		<p><@s.text name="results.yousaid"/></p>
		<p><strong>$$ \Large{ ${Request.answer} }$$</strong></p>
		<p><@s.text name="results.but.actually"/></p>
		$$ \Large{ ${Request.exercise.statement} = ${Request.exercise.solution} }$$
	<#break>
		
</#switch>