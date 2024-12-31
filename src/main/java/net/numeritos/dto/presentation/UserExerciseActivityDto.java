package net.numeritos.dto.presentation;

import java.util.Date;

import lombok.Data;
import net.numeritos.constants.ExerciseResult;

public @Data class UserExerciseActivityDto {

	private int id;
	
	private UserDto user;
	
	private ExerciseDto exercise;
	
	private ExerciseResult result;
	
	private Date time;
	
	private String rawAnswer;
}
