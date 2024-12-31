package net.numeritos.dto.db.ormlite;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

import lombok.Data;

@DatabaseTable(tableName = "exercises")
public @Data class Exercise {
	
	public static final String EXERCISE_TYPE_FIELD_NAME = "type";

	@DatabaseField(id = true)
	private int id;
	
	@DatabaseField
	private int type;
	
	@DatabaseField
	private String statement;
	
	@DatabaseField
	private String solution;
}
