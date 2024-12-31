package net.numeritos.dto.presentation;

import lombok.Data;

public @Data class UserResults {

	private String name;
	
	private String surname;
	
	private int userId;
	
	private ResultsDto results;
}
