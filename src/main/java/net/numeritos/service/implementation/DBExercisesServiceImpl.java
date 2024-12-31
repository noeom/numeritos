package net.numeritos.service.implementation;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.stmt.UpdateBuilder;

import lombok.Data;
import net.numeritos.constants.ExerciseResult;
import net.numeritos.dto.db.ormlite.Exercise;
import net.numeritos.dto.db.ormlite.UserExerciseActivity;
import net.numeritos.dto.db.ormlite.UserModuleIndex;
import net.numeritos.dto.presentation.ExerciseDto;
import net.numeritos.dto.presentation.UserDto;
import net.numeritos.service.declaration.AnswerProcessingService;
import net.numeritos.service.declaration.BeanMapperService;
import net.numeritos.service.declaration.ExercisesService;
import net.numeritos.service.declaration.ModulesService;

public @Data class DBExercisesServiceImpl implements ExercisesService {

	// Exercises DAO.
	private Dao<Exercise, Integer> exercisesDao;
	
	// User module index DAO. User module index have a composite PK,
	// hence the Object as second parameter.
	private Dao<UserModuleIndex, Object> modIndexDao;
	
	// User exercise activity DAO.
	private Dao<UserExerciseActivity, Integer> userExerciseActivityDao;

	// Modules service.
	private ModulesService modulesService;
	
	// Answer processing service.
	private AnswerProcessingService answerProcessingService;
	
	// Bean mapping service
	private BeanMapperService beanMapperService;
	
	@Override
	public ExerciseDto getExerciseForUser(UserDto user) throws SQLException {
		
		// Get module index (actually an offset)
		int moduleIndex = this.getOrGenerateUserModuleIndex(user, user.getDefaultModule());
		
		// Get exercise.
		return beanMapperService.map(exercisesDao.queryForId(moduleIndex + this.modulesService.getModuleById(user.getDefaultModule()).getStartIdx()));
	}
	
	@Override
	public ExerciseResult checkAndRecordAnswer(UserDto user, String answer, ExerciseDto exercise) throws SQLException {
		
		// Check answer.
		ExerciseResult result = this.answerProcessingService.checkAnswer(answer, exercise);
		
		// Record it!
		UserExerciseActivity uea = new UserExerciseActivity();
		uea.setExercise(beanMapperService.map(exercise));
		uea.setRawAnswer(answer);
		uea.setResult(result.getIntCode());
		uea.setTime(new Date());
		uea.setUser(beanMapperService.map(user));
		userExerciseActivityDao.create(uea);
		
		// Update user exercise index.
		int numExercises = this.modulesService.getExercisesInModule(exercise.getType());
		
		// Get module index (actually an offset)
		int moduleIndex = this.getOrGenerateUserModuleIndex(user, user.getDefaultModule());
		
		// Update it.
		moduleIndex++;
		if (moduleIndex >= numExercises) moduleIndex = 0;
		
		// Store new module index.
		UpdateBuilder<UserModuleIndex, Object> updateBuilder = modIndexDao.updateBuilder();
		
		updateBuilder.updateColumnValue(UserModuleIndex.CURRENT_INDEX_FIELD_NAME, moduleIndex)
				.where().eq(UserModuleIndex.USER_ID_FIELD_NAME, user.getId())
				.and().eq(UserModuleIndex.MODULE_ID_FIELD_NAME, exercise.getType());
		
		updateBuilder.update();
		  
		return result;
	}
	
	private int getOrGenerateUserModuleIndex(UserDto user, int moduleId) throws SQLException {

		// Lookup user module index.
		List<UserModuleIndex> indexes = modIndexDao.queryBuilder().where().eq(UserModuleIndex.USER_ID_FIELD_NAME, user.getId()).and().eq(UserModuleIndex.MODULE_ID_FIELD_NAME, user.getDefaultModule()).query();
		
		if (indexes.size() > 0) {
			// Index found. Return it.
			return indexes.get(0).getCurrentIndex();
		}

		// There is no module index. Create a new one.
		int numExercises =  this.modulesService.getExercisesInModule(moduleId);
		int moduleIndex = ThreadLocalRandom.current().nextInt(0, numExercises);
		
		// And store it on the database.
		modIndexDao.updateRaw("INSERT INTO user_module_index(user_id, module_id, current_index) VALUES(?, ?, ?)",
				String.valueOf(user.getId()), String.valueOf(user.getDefaultModule()), String.valueOf(moduleIndex));
		
		return moduleIndex;
	}

}
