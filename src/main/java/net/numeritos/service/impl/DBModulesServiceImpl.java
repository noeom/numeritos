package net.numeritos.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.j256.ormlite.dao.Dao;

import lombok.Data;
import net.numeritos.dto.db.ormlite.Module;
import net.numeritos.service.ModulesService;

public @Data class DBModulesServiceImpl implements ModulesService {

	private Map<Integer, Module> modulesCache = null;
	
	// Modules DAO.
	private Dao<Module, Integer> modulesDao;
	
	public void init() throws SQLException {
		List<Module> modulesList= modulesDao.queryForAll();
		modulesCache = new HashMap<Integer, Module>();
		for (Module m: modulesList) {
			modulesCache.put(m.getId(), m);
		}
	}
	
	@Override
	public Module getModuleById(int moduleId) {
		return modulesCache.get(moduleId);
	}

	@Override
	public int getExercisesInModule(int moduleId) {
		Module module = this.getModuleById(moduleId);
		return module.getEndIdx() - module.getStartIdx() + 1;
	}

}
