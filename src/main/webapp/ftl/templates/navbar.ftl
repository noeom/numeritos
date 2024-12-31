<nav class="navbar sticky-top bg-light shadow justify-content-around">

	<@s.a action="userSettings">
		<i class="text-primary fa-solid fa-xl fa-user-gear m-1" title="<@s.text name='navbar.title.user_config'/>"></i>
	</@s.a>

	<#if Session.user.admin>
	<@s.a action="adminConsole">
		<i class="text-warning fa-solid fa-users-rectangle fa-xl m-1" title="<@s.text name='navbar.title.supervisor'/>"></i>
	</@s.a>		
	</#if>
		
	<@s.a action="stats">
        <i class="tex-primary fa-solid fa-xl fa-chart-column m-1" title="<@s.text name='navbar.title.user_stats'/>"></i>
	</@s.a>

	<@s.a action="modulesList">
        <i class="text-primary fa-solid fa-xl fa-cube m-1" title="<@s.text name='navbar.title.select_module'/>"></i>
	</@s.a>

	<@s.a action="logout">
        <i class="text-danger fa-solid fa-power-off fa-xl m-1" title="<@s.text name='navbar.title.logout'/>"></i>
	</@s.a>
	
</nav>