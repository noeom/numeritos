package net.numeritos.struts.actions;

import lombok.Getter;
import lombok.Setter;
import net.numeritos.dto.db.ormlite.UserGroup;
import net.numeritos.service.declaration.GroupsService;

public class UserSettingsAction extends BaseAction {

	/**
	 * Serial version ID.
	 */
	private static final long serialVersionUID = -7587843107228588340L;
	
	@Getter
	@Setter
	private GroupsService groupsService;
	
	@Getter
	@Setter
	public UserGroup userGroup;

	@Override
	public String execute() throws Exception {
		
		// Lookup user group.
		this.userGroup = groupsService.getGroupById(this.getUser().getUserGroup().getId());

		return BaseAction.SUCCESS;
	}
}
