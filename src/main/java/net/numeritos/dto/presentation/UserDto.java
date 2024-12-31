package net.numeritos.dto.presentation;

import java.util.Date;

import lombok.Data;

public @Data class UserDto {
	
	private int id;
	
	private String name;
	
	private String surname;
	
	private String email;
	
	private boolean admin;
	
	private boolean active;
	
	private Date expiryDate;
	
	private int defaultModule;
	
	private UserGroupDto userGroup;
}
