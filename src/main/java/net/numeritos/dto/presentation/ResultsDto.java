package net.numeritos.dto.presentation;

import lombok.Data;

public @Data class ResultsDto {

	private long right;
	
	private long nearly;
	
	private long wrong;
	
	private int timeMinutes;
}
