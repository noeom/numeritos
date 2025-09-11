package net.numeritos.service;

import java.sql.SQLException;

import net.numeritos.constants.ExerciseResult;
import net.numeritos.dto.presentation.ExerciseDto;
import net.numeritos.dto.presentation.UserDto;

public interface ExercisesService {

	public ExerciseDto getExerciseForUser(UserDto user) throws SQLException;
	
	public ExerciseResult checkAndRecordAnswer(UserDto user, String answer, ExerciseDto exercise)  throws SQLException;
	
}
