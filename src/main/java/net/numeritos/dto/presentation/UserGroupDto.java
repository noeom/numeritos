package net.numeritos.dto.presentation;

import lombok.Data;

public @Data class UserGroupDto {
	
	private int id;
	
	private String name;
	
	private OrganizationDto organization;
}
