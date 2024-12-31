package net.numeritos.struts.actions;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.interceptor.parameter.StrutsParameter;

import com.opensymphony.xwork2.Action;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import net.numeritos.dto.db.ormlite.UserGroup;
import net.numeritos.dto.presentation.PresentationGroup;
import net.numeritos.service.declaration.GroupsService;
import net.numeritos.service.declaration.UsersService;

@EqualsAndHashCode(callSuper=false)
public @Data class AdminConsoleGroupsAction extends BaseAction {

	/**
	 * Serial version ID.
	 */	
	private static final long serialVersionUID = -3495945517296894293L;
	
	@Getter
	@Setter
	private GroupsService groupsService;
	
	@Getter
	@Setter
	private UsersService usersService;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private String groupName;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private int groupId;
	
	@Getter
	@Setter
	private List<PresentationGroup> groups;
	
	@Override
	public String execute() throws Exception {
		
		// Lookup user group.
		//UserGroup userGroup = groupsService.getGroupById(this.user.getUserGroup().getId());
		
		// Lookup groups from the same organization.
		List<UserGroup> dbGroups = this.groupsService.getGroupsByOrganization(this.getUser().getUserGroup().getOrganization().getId());
		
		groups = new ArrayList<PresentationGroup>();
		for(UserGroup g: dbGroups) {
			PresentationGroup presGroup = new PresentationGroup();
			presGroup.setId(g.getId());
			presGroup.setName(g.getName());
			presGroup.setSize(usersService.countUsersInGroup(g.getId()));
			groups.add(presGroup);
		}
		
		return Action.SUCCESS;
	}
	
	public String create() throws Exception {
		
		// Lookup user group to get organization id.
		UserGroup userGroup = groupsService.getGroupById(this.getUser().getUserGroup().getId());
		
		// Add new group.
		this.groupsService.createGroup(groupName, userGroup.getOrganization().getId());
		
		return Action.SUCCESS;
	}
	
	public String delete() throws Exception {
		
		// Lookup user group to get organization id.
		UserGroup selectedGroup = groupsService.getGroupById(this.getGroupId());
		
		// Lookup user group to get organization id.
		UserGroup userGroup = groupsService.getGroupById(this.getUser().getUserGroup().getId());
		
		// Delete if they match.
		if (selectedGroup.getOrganization().getId().equals(userGroup.getOrganization().getId())) {
			groupsService.deleteGroup(this.getGroupId());
		}
		
		return Action.SUCCESS;		
	}
}
