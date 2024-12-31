package net.numeritos.struts.interceptors;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import net.numeritos.constants.SessionKeys;
import net.numeritos.dto.presentation.UserDto;
import net.numeritos.struts.actions.BaseAction;
import net.numeritos.struts.interfaces.UserAware;

public class AuthenticationInterceptor implements Interceptor {

	/**
	 * Serial version ID.
	 */
	private static final long serialVersionUID = -2622197626349738305L;

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
		
		// Inject user if needed.
		Action action = (Action) invocation.getAction();
		if (action instanceof UserAware) {
			((UserAware) action).setUser(user);
		}
		
		// Continue with invocation.
		return invocation.invoke();
	}

}
