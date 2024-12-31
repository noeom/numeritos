package net.numeritos.service.implementation;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.stmt.QueryBuilder;

import lombok.Data;
import net.numeritos.constants.ExerciseResult;
import net.numeritos.dto.db.ormlite.Exercise;
import net.numeritos.dto.db.ormlite.UserExerciseActivity;
import net.numeritos.dto.presentation.ResultsDto;
import net.numeritos.service.declaration.ExerciseActivityService;


public @Data class DBExerciseActivityServiceImpl implements ExerciseActivityService {

	// Exercises DAO.
	private Dao<Exercise, Integer> exercisesDao;
	
	// User exercise activity DAO.
	private Dao<UserExerciseActivity, Integer> userExerciseActivityDao;
	
	@Override
	public ResultsDto getResults(int userId, int moduleId, int minutes) throws SQLException {
		
		ResultsDto results = new ResultsDto();
		
		results.setTimeMinutes(minutes);
		results.setRight(countResults(userId, moduleId, ExerciseResult.RIGHT, minutes));
		results.setWrong(countResults(userId, moduleId, ExerciseResult.WRONG, minutes));
		results.setNearly(countResults(userId, moduleId, ExerciseResult.DIDNT_SIMPLIFY, minutes));

		return results;
	}
	
	private long countResults(int userId, int moduleId, ExerciseResult result, int minutes) throws SQLException {
		
		QueryBuilder<Exercise, Integer> exercisesQB = exercisesDao.queryBuilder();
		exercisesQB.where().eq(Exercise.EXERCISE_TYPE_FIELD_NAME, moduleId);
		
		QueryBuilder<UserExerciseActivity, Integer> ueActivityQB = userExerciseActivityDao.queryBuilder();

		if (minutes >= 0) {
			Calendar dateGenerator = Calendar.getInstance();
			dateGenerator.setTime(new Date());
			dateGenerator.add(Calendar.MINUTE, -minutes);
			ueActivityQB.where().eq(UserExerciseActivity.USER_ID_FIELD_NAME, userId).and()
					.eq(UserExerciseActivity.EXERCISE_RESULT_FIELD_NAME, result.getIntCode()).and()
					.ge(UserExerciseActivity.TIME_FIELD_NAME, dateGenerator.getTime());
		} else {
			ueActivityQB.where().eq(UserExerciseActivity.USER_ID_FIELD_NAME, userId).and()
			.eq(UserExerciseActivity.EXERCISE_RESULT_FIELD_NAME, result.getIntCode());
		}
		
		return ueActivityQB.join(exercisesQB).countOf();
	}

}
