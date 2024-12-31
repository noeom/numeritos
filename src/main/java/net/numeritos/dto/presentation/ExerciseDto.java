package net.numeritos.dto.presentation;

import lombok.Data;

public @Data class ExerciseDto {
	
	private int id;
	
	private int type;
	
	private String statement;
	
	private String solution;
}
