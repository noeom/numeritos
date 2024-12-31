package net.numeritos.struts.actions;

import com.opensymphony.xwork2.Action;

public class LogoutAction extends BaseAction {

	/**
	 * Serial Version UID.
	 */
	private static final long serialVersionUID = -7084923608973991395L;

	@Override
	public String execute() throws Exception {
		
		// Clear session.
		this.getSession().clear();
		
		// Done!
		return Action.SUCCESS;
	}
}
