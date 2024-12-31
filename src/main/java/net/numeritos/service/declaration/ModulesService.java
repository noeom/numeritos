package net.numeritos.service.declaration;

import net.numeritos.dto.db.ormlite.Module;

public interface ModulesService {
	
	public Module getModuleById(int moduleId);
	
	public int getExercisesInModule(int moduleId);
}
