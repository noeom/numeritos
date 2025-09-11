package net.numeritos.service;

import net.numeritos.constants.ExerciseResult;
import net.numeritos.dto.presentation.ExerciseDto;

public interface AnswerProcessingService {

	public boolean validAnswerFormat(String answer, int exerciseType);
	
	public ExerciseResult checkAnswer(String Answer, ExerciseDto exercise);
}
