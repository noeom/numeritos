package net.numeritos.struts.actions;

import org.apache.struts2.interceptor.parameter.StrutsParameter;

import com.opensymphony.xwork2.Action;

import lombok.Getter;
import lombok.Setter;
import net.numeritos.constants.SessionKeys;
import net.numeritos.service.declaration.UsersService;

public class ChangePasswordAction extends BaseAction {

	/**
	 * Serial version UID.
	 */
	private static final long serialVersionUID = -1662479643864037512L;

	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private String oldPassword;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private String newPassword;
	
	@Getter
	@Setter
	private UsersService usersService;
	
	@Override
	public String execute() throws Exception {

		// Current password is wrong.
		if (!this.usersService.checkPassword(this.getUser().getId(), oldPassword))
		{
			this.addActionError(this.getText("userSettings.error.wrongPassword"));
			return Action.INPUT;	
		}
		
		// Current password is OK. Update user password.
		usersService.updatePassword(this.getUser().getId(), newPassword);
		
		// Update user on session too.
		this.setUser(usersService.getUserByEmail(this.getUser().getEmail()));
		this.getSession().put(SessionKeys.USER, this.getUser());
		
		// Show success message and return to user settings page.
		this.addActionMessage(this.getText("userSettings.message.passwordChanged"));
		return Action.SUCCESS;
	}
}
