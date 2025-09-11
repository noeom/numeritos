package net.numeritos.struts.actions.admin.json;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.interceptor.parameter.StrutsParameter;

import org.apache.struts2.action.Action;

import lombok.Getter;
import lombok.Setter;
import net.numeritos.dto.db.ormlite.UserGroup;
import net.numeritos.dto.presentation.ResultsDto;
import net.numeritos.dto.presentation.UserDto;
import net.numeritos.dto.presentation.UserResults;
import net.numeritos.service.ExerciseActivityService;
import net.numeritos.service.GroupsService;
import net.numeritos.service.UsersService;
import net.numeritos.struts.actions.BaseAction;

public class JsonAdminAction extends BaseAction {

	/*
	 * Serial version ID.
	 */
	private static final long serialVersionUID = -4872872543328763872L;
	
	@Getter
	@Setter
	private UsersService usersService;
	
	@Getter
	@Setter
	private GroupsService groupsService;
	
	@Getter
	@Setter
	private ExerciseActivityService exerciseActivityService;
	
	@Getter
	@Setter
	private List<UserDto> users;
	
	@Getter
	@Setter
	private List<UserResults> userResults;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private int groupId;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private int userId;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private int moduleId;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private int timeLapse;
	
	@Getter
	@Setter
	private InputStream downloadStream;
	
	@Getter
	@Setter
	private String fileName;
	
	public String getUsersByGroupId() throws Exception {
		users = usersService.getUsersByGroup(this.groupId);
		return Action.SUCCESS;
	}
	
	public String resetUserPassword()  throws Exception {
		usersService.updatePassword(userId, getText("default.password"));
		return Action.SUCCESS;
	}
	
	public String changeUserGroup() throws Exception {
		
		// Get the current group of the user.
		UserDto user = usersService.getUserById(this.userId);
		
		int currentGroupId = user.getUserGroup().getId();
		int requestedGroupId = this.groupId;
		
		// Lookup groups from the same organization.
		List<UserGroup> dbGroups = this.groupsService.getGroupsByOrganization(this.getUser().getUserGroup().getOrganization().getId());
	
		// Verify both groups (from and to) are managed by current user.
		boolean groupFrom = false, groupTo = false;
		for (UserGroup group: dbGroups) {
			if (group.getId() == currentGroupId) groupFrom = true;
			if (group.getId() == requestedGroupId) groupTo = true;
		}
		
		// Both found. Proceed.
		if (groupFrom && groupTo) {
			usersService.updateGroup(userId, groupId);
		}
		
		return Action.SUCCESS;
	}
	
	public String getResults() throws Exception {
		
		// Get all users in group.
		List<UserDto> users = usersService.getUsersByGroup(groupId);
		
		// Get results for all of them.
		this.userResults = new ArrayList<UserResults>();
		
		for(UserDto user: users) {
			UserResults userResults = new UserResults();
			userResults.setName(user.getName());
			userResults.setSurname(user.getSurname());
			userResults.setUserId(user.getId());
			userResults.setResults(exerciseActivityService.getResults(user.getId(), moduleId, this.timeLapse));
			
			this.userResults.add(userResults);
		}
		
		return Action.SUCCESS;
	}
	
	public String getResultsFile() throws Exception {
		
		String CSV_SEPARATOR = ",";
		
		StringBuilder builder = new StringBuilder();
		
		// Write csv headers.
		builder.append(this.getText("admin.results.table.name")).append(CSV_SEPARATOR);
		builder.append(this.getText("admin.results.table.surname")).append(CSV_SEPARATOR);
		builder.append(this.getText("admin.results.table.right")).append(CSV_SEPARATOR);
		builder.append(this.getText("admin.results.table.wrong")).append(CSV_SEPARATOR);
		builder.append(this.getText("admin.results.table.total")).append(System.lineSeparator());


		// Get all users in group.
		List<UserDto> users = usersService.getUsersByGroup(groupId);
		
		// Get results for all of them.
		this.userResults = new ArrayList<UserResults>();
		
		for(UserDto user: users) {
			ResultsDto results = exerciseActivityService.getResults(user.getId(), moduleId, this.timeLapse);
			builder.append(user.getName()).append(CSV_SEPARATOR);
			builder.append(user.getSurname()).append(CSV_SEPARATOR);
			builder.append(results.getRight()).append(CSV_SEPARATOR);
			builder.append(results.getWrong()).append(CSV_SEPARATOR);
			builder.append(results.getRight() + results.getWrong()).append(System.lineSeparator());
		}
		
		this.downloadStream = new ByteArrayInputStream(builder.toString().getBytes());
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY_MM_dd_H_m_s");
		
		this.fileName = "results_" + simpleDateFormat.format(new Date());
		
		return Action.SUCCESS;
	}	
}
