package net.numeritos.service.implementation;

import java.sql.SQLException;
import java.util.List;

import com.j256.ormlite.dao.Dao;

import lombok.Data;
import net.numeritos.dto.db.ormlite.Organization;
import net.numeritos.dto.db.ormlite.UserGroup;
import net.numeritos.service.declaration.GroupsService;

public @Data class DBGroupsServiceImpl implements GroupsService {

	private Dao<UserGroup, Integer> groupsDao;

	@Override
	public UserGroup getGroupById(int id) throws SQLException {
		return groupsDao.queryForId(id);
	}

	@Override
	public List<UserGroup> getGroupsByOrganization(int org_id) throws SQLException {
		return groupsDao.queryForEq("org_id", org_id);
	}
	
	@Override
	public void createGroup(String groupName, int org_id) throws SQLException {
		UserGroup newGroup = new UserGroup();
		newGroup.setName(groupName);
		Organization organization = new Organization();
		organization.setId(org_id);
		newGroup.setOrganization(organization);
		groupsDao.create(newGroup);
	}

	@Override
	public void deleteGroup(int id) throws SQLException {
		groupsDao.deleteById(id);
	}
}
