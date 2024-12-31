package net.numeritos.struts.actions;

import org.apache.struts2.interceptor.parameter.StrutsParameter;

import com.opensymphony.xwork2.Action;

import lombok.Getter;
import lombok.Setter;
import net.numeritos.constants.SessionKeys;
import net.numeritos.dto.presentation.UserDto;
import net.numeritos.service.declaration.UsersService;

public class LoginAction extends BaseAction {

	/**
	 * Serial version ID.
	 */
	private static final long serialVersionUID = 1L;

	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private String email;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private String password;
	
	@Getter
	@Setter
	private UsersService usersService;
	
	@Override
	public String execute() throws Exception {

		// Find user.
		UserDto user = usersService.getUserByEmail(email);
		
		// User not found.
		if (user == null) {
			this.addActionError(this.getTextParams("error.user.doesnt.exist", email));
			return Action.INPUT;
		}
		
		// User found. Check password against stored hash.
		boolean passwordOK = usersService.checkPassword(user.getId(), this.password);
		
		// Password is wrong.
		if (!passwordOK) {
			this.addActionError(this.getText("error.wrong.password"));
			return Action.INPUT;
		}
		
		// All right. Access granted.
		// Upload user to session
		this.getSession().put(SessionKeys.USER, user);
		
		return Action.SUCCESS;
	}
	
	@Override
	public void validate() {
		if (this.email.length() == 0) addFieldError("username", getText("mandatory.field.email"));
		if (this.password.length() == 0) addFieldError("password", getText("mandatory.field.password"));
	}
}
