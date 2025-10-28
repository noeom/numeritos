<nav class="navbar sticky-top bg-light shadow justify-content-around">

	<@s.a action="userSettings">
		<i class="text-primary bi bi-person-fill-gear h3 m-1" title="<@s.text name='navbar.title.user_config'/>"></i>
	</@s.a>

	<#if Session.user.admin>
	<@s.a action="adminConsole">
		<i class="text-warning bi bi-person-workspace h3 m-1" title="<@s.text name='navbar.title.supervisor'/>"></i>
	</@s.a>		
	</#if>
		
	<@s.a action="stats">
        <i class="tex-primary bi bi-bar-chart-line-fill h3 m-1" title="<@s.text name='navbar.title.user_stats'/>"></i>
	</@s.a>

	<@s.a action="modulesList">
        <i class="text-primary bi bi-box h3 m-1" title="<@s.text name='navbar.title.select_module'/>"></i>
	</@s.a>

	<@s.a action="logout">
        <i class="text-danger bi bi-box-arrow-right h3 m-1" title="<@s.text name='navbar.title.logout'/>"></i>
	</@s.a>
	
</nav>