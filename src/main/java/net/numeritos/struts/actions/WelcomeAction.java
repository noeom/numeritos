package net.numeritos.struts.actions;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class WelcomeAction extends ActionSupport {

	/**
	 * Serial version ID.
	 */
	private static final long serialVersionUID = -5785313956049389503L;

	@Override
	public String execute() throws Exception {
		return Action.SUCCESS;
	}
}
