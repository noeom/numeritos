package net.numeritos.service.declaration;

import java.sql.SQLException;
import java.util.List;

import net.numeritos.dto.presentation.UserDto;

public interface UsersService {

	public UserDto getUserByEmail(String email) throws SQLException;
	
	public UserDto getUserById(int id) throws SQLException;
	
	public void updatePassword(int userId, String newPassword) throws SQLException;
	
	public void updateGroup(int userId, int groupId) throws SQLException;
	
	public boolean setDefaultModule(int userId, int defaultModuleId) throws SQLException;
	
	public long countUsersInGroup(int groupId) throws SQLException;
	
	public List<UserDto> getUsersByGroup(int groupId) throws SQLException;
	
	public boolean checkPassword(int userId, String plainPassword) throws SQLException;
}
