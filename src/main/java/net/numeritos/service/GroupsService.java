package net.numeritos.service;

import java.sql.SQLException;
import java.util.List;

import net.numeritos.dto.db.ormlite.UserGroup;

public interface GroupsService {

	public UserGroup getGroupById(int id) throws SQLException;
	
	public List<UserGroup> getGroupsByOrganization(int org_id) throws SQLException;
	
	public void createGroup(String groupName, int org_id) throws SQLException;
	
	public void deleteGroup(int id) throws SQLException;
	
}
