package net.numeritos.service.support;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.j256.ormlite.dao.Dao;

import lombok.Data;
import net.numeritos.dto.db.ormlite.Exercise;

public @Data class DBExerciseIndexCache {

	// Exercises DAO.
	private Dao<Exercise, Integer> exercisesDao;
	
	// Indexes map
	private Map<Integer, List<Integer>> indexesMap;
	
	// Init method. Loads all indexes from database.
	public void init() throws SQLException {
		List<Exercise> allExercises = exercisesDao.queryForAll();
		indexesMap = new HashMap<Integer, List<Integer>>();
		
		for (Exercise exercise: allExercises) {
			List<Integer> idList = indexesMap.get(exercise.getType());
			if (idList == null) {
				idList = new ArrayList<Integer>();
				indexesMap.put(exercise.getType(), idList);
			}
			idList.add(exercise.getId());
		}
		
		for (Integer type: indexesMap.keySet()) {
			Collections.sort(indexesMap.get(type));
		}
	}
	
	public Integer getDBIdFromOffset(int exerciseType, int exerciseOffset) {
		List<Integer> list = indexesMap.get(exerciseType);
		if (list == null) return null;
		if (exerciseOffset >= list.size()) return null;
		return list.get(exerciseOffset);
	}
	
	public Integer getNumOfExercisesByType(int exerciseType) {
		List<Integer> list = indexesMap.get(exerciseType);
		if (list == null) return null;
		return list.size();
	}

}
