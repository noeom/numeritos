package net.numeritos.struts.actions;

import org.apache.struts2.interceptor.parameter.StrutsParameter;

import com.opensymphony.xwork2.Action;

import lombok.Getter;
import lombok.Setter;
import net.numeritos.service.declaration.UsersService;

public class SelectModuleAction extends BaseAction {
	
	/**
	 * Serial version ID.
	 */	
	private static final long serialVersionUID = -6532511667295657370L;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private int moduleId;
	
	@Getter
	@Setter
	private UsersService usersService;
	
	@Override
	public String execute() throws Exception {
		
		// Try to update default module on DB.
		boolean success = usersService.setDefaultModule(this.getUser().getId(), this.moduleId);
		
		if (success) {
			// Update user on session too.
			this.getUser().setDefaultModule(moduleId);
			return Action.SUCCESS;
		} else {
			this.addActionError(this.getText("moduleList.error.noSuchModuleId"));
			return Action.INPUT;
		}
	}
}
