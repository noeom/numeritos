package net.numeritos.service.implementation;

import java.util.ArrayList;
import java.util.List;

import net.numeritos.constants.ExerciseResult;
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
import net.numeritos.service.declaration.BeanMapperService;



public class BeanMapperServiceImpl implements BeanMapperService {

	@Override
	public OrganizationDto map(Organization organization) {
		
		if (organization == null) return null;
		
		OrganizationDto organizationDto = new OrganizationDto();
		
		organizationDto.setId(organization.getId());
		organizationDto.setName(organization.getName());
		
		return organizationDto;
	}
	
	@Override
	public Organization map(OrganizationDto organizationDto) {
		
		if (organizationDto == null) return null;
		
		Organization organization = new Organization();
		
		organization.setId(organizationDto.getId());
		organization.setName(organizationDto.getName());
		
		return organization;
	}	

	@Override
	public UserGroupDto map(UserGroup userGroup) {
		
		if (userGroup == null) return null;
		
		UserGroupDto userGroupDto = new UserGroupDto();
		
		userGroupDto.setId(userGroup.getId());
		userGroupDto.setName(userGroup.getName());
		userGroupDto.setOrganization(map(userGroup.getOrganization()));
		
		return userGroupDto;
	}
	
	@Override
	public UserGroup map(UserGroupDto userGroupDto) {
		
		if (userGroupDto == null) return null;
		
		UserGroup userGroup = new UserGroup();
		
		userGroup.setId(userGroupDto.getId());
		userGroup.setName(userGroupDto.getName());
		userGroup.setOrganization(map(userGroupDto.getOrganization()));
		
		return userGroup;
	}	

	@Override
	public UserDto map(User user) {
		
		if (user == null) return null;
		
		UserDto userDto = new UserDto();
		
		userDto.setId(user.getId());
		userDto.setName(user.getName());
		userDto.setSurname(user.getSurname());
		userDto.setEmail(user.getEmail());
		userDto.setActive(user.isActive());
		userDto.setAdmin(user.isAdmin());
		userDto.setUserGroup(map(user.getUserGroup()));
		userDto.setDefaultModule(user.getDefaultModule());
		userDto.setExpiryDate(user.getExpiryDate());
		
		return userDto;
	}
	
	@Override
	public User map(UserDto userDto) {
		
		if (userDto == null) return null;
		
		User user = new User();
		
		user.setId(userDto.getId());
		user.setName(userDto.getName());
		user.setSurname(userDto.getSurname());
		user.setEmail(userDto.getEmail());
		user.setActive(userDto.isActive());
		user.setAdmin(userDto.isAdmin());
		user.setUserGroup(map(userDto.getUserGroup()));
		user.setDefaultModule(userDto.getDefaultModule());
		user.setExpiryDate(userDto.getExpiryDate());
		
		return user;
	}	

	@Override
	public List<UserDto> map(List<User> users) {
		if (users == null) return null;
		
		List<UserDto> userDtoList = new ArrayList<UserDto>();
		
		for (User u: users) {
			userDtoList.add(map(u));
		}
		
		return userDtoList;
	}

	@Override
	public ExerciseDto map(Exercise exercise) {
		
		if (exercise == null) return null;
		
		ExerciseDto exerciseDto = new ExerciseDto();
		
		exerciseDto.setId(exercise.getId());
		exerciseDto.setType(exercise.getType());
		exerciseDto.setStatement(exercise.getStatement());
		exerciseDto.setSolution(exercise.getSolution());
		
		return exerciseDto;
	}
	
	@Override
	public Exercise map(ExerciseDto exerciseDto) {
		
		if (exerciseDto == null) return null;
		
		Exercise exercise = new Exercise();
		
		exercise.setId(exerciseDto.getId());
		exercise.setType(exerciseDto.getType());
		exercise.setStatement(exerciseDto.getStatement());
		exercise.setSolution(exerciseDto.getSolution());
		
		return exercise;
	}

	@Override
	public UserExerciseActivityDto map(UserExerciseActivity uea) {
		
		if (uea == null) return null;
		
		UserExerciseActivityDto ueaDto = new UserExerciseActivityDto();
		
		ueaDto.setId(uea.getId());
		ueaDto.setExercise(map(uea.getExercise()));
		ueaDto.setRawAnswer(uea.getRawAnswer());
		ueaDto.setTime(uea.getTime());
		ueaDto.setUser(map(uea.getUser()));
		switch (uea.getResult()) {
		case 0:
			ueaDto.setResult(ExerciseResult.WRONG);
			break;
		case 1:
			ueaDto.setResult(ExerciseResult.RIGHT);
			break;
		case 2:
			ueaDto.setResult(ExerciseResult.DIDNT_SIMPLIFY);
			break;
		default:
			ueaDto.setResult(ExerciseResult.UNDEFINED);
			break;
		}
		ueaDto.setResult(ExerciseResult.values()[uea.getResult()]);
		
		return ueaDto;
	}
}
