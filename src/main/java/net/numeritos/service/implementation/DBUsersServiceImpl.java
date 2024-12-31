package net.numeritos.service.implementation;

import java.sql.SQLException;
import java.util.List;

import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.stmt.UpdateBuilder;

import lombok.Data;
import net.numeritos.dto.db.ormlite.Module;
import net.numeritos.dto.db.ormlite.User;
import net.numeritos.dto.presentation.UserDto;
import net.numeritos.service.declaration.BeanMapperService;
import net.numeritos.service.declaration.CryptoService;
import net.numeritos.service.declaration.ModulesService;
import net.numeritos.service.declaration.UsersService;

public @Data class DBUsersServiceImpl implements UsersService {
	
	private BeanMapperService beanMapperService;

	// Modules service.
	private ModulesService modulesService;
	
	// Criptography service.
	private CryptoService cryptoService;
	
	// Users DAO.
	private Dao<User, Integer> usersDao;
	
	@Override
	public UserDto getUserByEmail(String email) throws SQLException {
	
		QueryBuilder<User, Integer> qb = usersDao.queryBuilder();
		
		List<User> users = qb.where().eq(User.EMAIL_FIELD_NAME, email).query();
		
		if (users.size() == 0) return null;
		
		return beanMapperService.map(users.get(0));
	}

	@Override
	public void updatePassword(int userId, String newPassword) throws SQLException {
		
		String newHash = cryptoService.hashPassword(newPassword);
		
		UpdateBuilder<User, Integer> ub = usersDao.updateBuilder();
		
		ub.updateColumnValue(User.PASSWORD_HASH_FIELD_NAME, newHash).where().eq(User.ID_FIELD_NAME, userId);
		
		ub.update();
		
	}

	@Override
	public boolean setDefaultModule(int userId, int defaultModuleId) throws SQLException {
		
		// Check for module in DB.
		Module module = modulesService.getModuleById(defaultModuleId);
		
		// If module doesn't exists, return false.
		if (module == null) return false;
		
		// Update user.
		UpdateBuilder<User, Integer> ub = usersDao.updateBuilder();
		ub.updateColumnValue(User.DEFAULT_MODULE_FIELD_NAME, defaultModuleId).where().eq(User.ID_FIELD_NAME, userId);
		ub.update();
		
		// All right!
		return true;
	}

	@Override
	public long countUsersInGroup(int groupId) throws SQLException {
		QueryBuilder<User, Integer> queryBuilder = usersDao.queryBuilder();
		
		return queryBuilder.where().eq(User.USER_GROUP_FIELD_NAME, groupId).countOf();
	}

	@Override
	public List<UserDto> getUsersByGroup(int groupId) throws SQLException {
		QueryBuilder<User, Integer> qb = usersDao.queryBuilder();
		return beanMapperService.map(qb.where().eq(User.USER_GROUP_FIELD_NAME, groupId).query());
	}

	@Override
	public void updateGroup(int userId, int groupId) throws SQLException {
		UpdateBuilder<User, Integer> ub = usersDao.updateBuilder();
		ub.updateColumnValue(User.USER_GROUP_FIELD_NAME, groupId).where().eq(User.ID_FIELD_NAME, userId);
		ub.update();
	}

	@Override
	public UserDto getUserById(int id) throws SQLException {
		return beanMapperService.map(usersDao.queryForId(id));
	}

	@Override
	public boolean checkPassword(int userId, String plainPassword) throws SQLException {
		User user = usersDao.queryForId(userId);
		return cryptoService.checkPassword(plainPassword, user.getPasswordHash());
	}	
}
