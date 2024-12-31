<#switch Request.resultCode>

	<#case 1>
		<p><@s.text name="results.equation.solution.single"/></p>
		$$ \Large{ ${Request.exercise.statement} } $$
		<p><@s.text name="results.is"/></p>
		$$ \Large{ x = ${Request.answer} } $$
	<#break>
	
	<#case 0>
		$$ \Large{ ${Request.exercise.statement} } $$
		<p><@s.text name="results.yousaid"/></p>
		<p><strong>$$ \Large{ x = ${Request.answer} }$$</strong></p>
		<p><@s.text name="results.but.actually"/></p>
		$$ \Large{ x = ${Request.exercise.solution} }$$
	<#break>
	
</#switch>	