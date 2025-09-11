package net.numeritos.struts.actions;

import org.apache.struts2.action.Action;
import org.apache.struts2.ActionSupport;

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
