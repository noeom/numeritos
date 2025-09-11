package net.numeritos.struts.actions;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.action.Action;
import org.apache.struts2.action.UploadedFilesAware;
import org.apache.struts2.dispatcher.multipart.UploadedFile;
import org.apache.struts2.interceptor.parameter.StrutsParameter;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import net.numeritos.constants.Utils;
import net.numeritos.dto.db.ormlite.UserGroup;
import net.numeritos.dto.presentation.PresentationGroup;
import net.numeritos.dto.presentation.UserDto;
import net.numeritos.dto.presentation.UserGroupDto;
import net.numeritos.service.CryptoService;
import net.numeritos.service.GroupsService;
import net.numeritos.service.UsersService;

@EqualsAndHashCode(callSuper=false)
public @Data class AdminConsoleGroupsAction extends BaseAction implements UploadedFilesAware {

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
	
	@Getter
	@Setter
	private CryptoService cryptoService;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private String groupName;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private int groupId;
	
	@Getter
	@Setter
	private List<PresentationGroup> groups;
	
	private UploadedFile usersFile;
	
	@Override
	public String execute() throws Exception {
		this.loadUserGroups();
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
	
	public String addUsersFromFile() throws Exception {
		
		// Import users.
		this.importUsersFromFile();
		
		// Refresh list with new users.
		this.loadUserGroups();
		
		return Action.SUCCESS;
	}
	
	private UserDto createDefaultUser(String name, String surname, String email, int userGroupId) {
		UserDto user = new UserDto();
		user.setActive(true);
		user.setAdmin(false);
		user.setDefaultModule(Utils.DEFAULT_MODULE);
		user.setEmail(email);
		user.setName(name);
		user.setPasswordHash(this.cryptoService.hashPassword(Utils.DEFAULT_PASSWORD));
		user.setSurname(surname);
		UserGroupDto userGroup = new UserGroupDto();
		userGroup.setId(userGroupId);
		user.setUserGroup(userGroup);
		return user;
	}
	
	public void withUploadedFiles(List<UploadedFile> uploadedFiles) {
		if (uploadedFiles.size() == 1) {
			this.usersFile = uploadedFiles.get(0);
		}
	}
	
	private void importUsersFromFile() throws IOException {
		if (this.usersFile == null) {
			this.addUserError("Es necesario subir un (y sólo un) fichero");
			return;
		}

		BufferedReader reader = new BufferedReader(new FileReader((File) usersFile.getContent()));
		String linea;
		int userCount = 0;
		int lineCount = 0;
		while( (linea = reader.readLine()) != null) {
			lineCount++;
			linea = linea.trim();
			String[] fields = linea.split(",");
			if (fields.length != 3) {
				this.addActionError(this.getTextParams("usersImport.error.numberOfFields", String.valueOf(lineCount)));
				continue;
			}
			String name = fields[0].replaceAll("[\"']", "").trim();
			String surname = fields[1].replaceAll("[\"']", "").trim();
			String email = fields[2].replaceAll("[\"']", "").trim();
			
			if (name.isEmpty() || surname.isEmpty() || email.isEmpty()) {
				this.addActionError(this.getTextParams("usersImport.error.emptyFields", String.valueOf(lineCount)));
				continue;
			}

			UserDto user = this.createDefaultUser(name, surname, email, this.getGroupId());
			try {
				this.usersService.createUser(user);				
			} catch (Exception e) {
				this.addActionError("El usuario " + name + " " + surname + " no se ha podido añadir.");
			}
			
			userCount++;		
		}		
		reader.close();
		this.addUserMessage("Se han añadido " + userCount + " usuarios correctamente.");
	}
	
	private void loadUserGroups() throws SQLException {
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
	}
}
