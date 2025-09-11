package net.numeritos.struts.interceptors;

import org.apache.struts2.ActionInvocation;
import org.apache.struts2.interceptor.Interceptor;

import net.numeritos.constants.SessionKeys;
import net.numeritos.dto.presentation.UserDto;
import net.numeritos.struts.actions.BaseAction;

public class AdministrationInterceptor implements Interceptor {

	/**
	 * Serial version ID.
	 */
	private static final long serialVersionUID = -3428447307964748000L;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

		// Get user from session.
		UserDto user = (UserDto) invocation.getInvocationContext().getSession().get(SessionKeys.USER);
		
		// No user found in session. Return to login.
		if (user == null) {
			return BaseAction.LOGIN;
		}
		
		// Check for admin privileges
		if (!user.isAdmin()) {
			return BaseAction.LOGIN;
		}
		
		// Continue with invocation.
		return invocation.invoke();
	}

}
