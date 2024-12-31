<#switch Request.resultCode>

	<#case 1>
		$$ \Large{ ${Request.exercise.statement} = ${Request.exercise.solution} }$$
	<#break>
	
	<#case 0>
		<p><@s.text name="results.yousaid"/></p>
		<p><strong>$$ \Large{ ${Request.exercise.statement} = ${Request.answer} }$$</strong></p>
		<p><@s.text name="results.but.actually"/></p>
		<p><strong>$$ \Large{ ${Request.exercise.statement} = ${Request.exercise.solution} }$$</strong></p>
	<#break>
	
	<#case 2>
		<p><@s.text name="results.yousaid"/></p>
		<p><strong>$$ \Large{ ${Request.exercise.statement} = ${Request.answer} }$$</strong></p>
		<p><@s.text name="results.ok.but.didnt.simplify"/></p>
		<p><strong>$$ \Large{ ${Request.exercise.statement} = ${Request.exercise.solution} }$$</strong></p>
	<#break>	
	
</#switch>	