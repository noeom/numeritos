package net.numeritos.service;

import java.util.List;

import net.numeritos.dto.db.ormlite.Exercise;
import net.numeritos.dto.db.ormlite.Organization;
import net.numeritos.dto.db.ormlite.User;
import net.numeritos.dto.db.ormlite.UserExerciseActivity;
import net.numeritos.dto.db.ormlite.UserGroup;
import net.numeritos.dto.presentation.ExerciseDto;
import net.numeritos.dto.presentation.OrganizationDto;
import net.numeritos.dto.presentation.UserDto;
import net.numeritos.dto.presentation.UserExerciseActivityDto;
import net.numeritos.dto.presentation.UserGroupDto;

public interface BeanMapperService {
	
	public OrganizationDto map(Organization organization);
	public Organization map(OrganizationDto organizationDto);
	
	public UserGroupDto map(UserGroup userGroup);
	public UserGroup map(UserGroupDto userGroupDto);
	
	public List<UserDto> map(List<User> users);
	
	public UserDto map(User user);
	public User map(UserDto userDto);
	
	public ExerciseDto map(Exercise exercise);
	public Exercise map(ExerciseDto exerciseDto);
	
	public UserExerciseActivityDto map(UserExerciseActivity uea);
}
