package net.numeritos.service.declaration;

import java.sql.SQLException;

import net.numeritos.dto.presentation.ResultsDto;

public interface ExerciseActivityService {

	public ResultsDto getResults(int userId, int moduleId, int minutes) throws SQLException;
}
