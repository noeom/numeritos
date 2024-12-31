package net.numeritos.struts.actions;

import java.util.List;

import com.opensymphony.xwork2.Action;

import lombok.Getter;
import lombok.Setter;
import net.numeritos.dto.db.ormlite.UserGroup;
import net.numeritos.service.declaration.GroupsService;

public class AdminConsoleAction extends BaseAction {

	/**
	 * Serial version ID.
	 */	
	private static final long serialVersionUID = 3933733769771408299L;

	@Getter
	@Setter
	private GroupsService groupsService;
	
	@Getter
	@Setter
	private List<UserGroup> groups;
	
	@Override
	public String execute() throws Exception {
		
		// Lookup groups from the same organization.
		groups = this.groupsService.getGroupsByOrganization(this.getUser().getUserGroup().getOrganization().getId());
		
		return Action.SUCCESS;
	}
}
