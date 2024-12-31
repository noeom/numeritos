package net.numeritos.struts.actions;

import java.util.List;

import com.opensymphony.xwork2.Action;

import lombok.Getter;
import lombok.Setter;
import net.numeritos.dto.db.ormlite.UserGroup;
import net.numeritos.service.declaration.GroupsService;
import net.numeritos.service.declaration.UsersService;

public class AdminConsoleUsersAction extends BaseAction {
	
	/*
	 * Serial version ID
	 */
	private static final long serialVersionUID = 3013985516187353466L;

	@Getter
	@Setter
	private GroupsService groupsService;
	
	@Getter
	@Setter
	private UsersService usersService;
	
	@Getter
	@Setter
	private List<UserGroup> groups;
	
	@Override
	public String execute() throws Exception {
		// Lookup user group.
		UserGroup userGroup = groupsService.getGroupById(this.getUser().getUserGroup().getId());
		
		// Lookup groups from the same organization.
		groups = this.groupsService.getGroupsByOrganization(userGroup.getOrganization().getId());
		
		return Action.SUCCESS;
	}
}
