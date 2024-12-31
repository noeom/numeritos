package net.numeritos.dto.db.ormlite;

import java.util.Date;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

import lombok.Data;

@DatabaseTable(tableName = "user_exercise_activity")
public @Data class UserExerciseActivity {

	public static final String USER_ID_FIELD_NAME = "user_id";
	public static final String EXERCISE_RESULT_FIELD_NAME = "result";
	public static final String TIME_FIELD_NAME = "time";
	
	@DatabaseField(generatedId = true)	
	private int id;
	
	@DatabaseField(columnName = USER_ID_FIELD_NAME, foreign = true, canBeNull = false)	
	private User user;
	
	@DatabaseField(columnName = "exercise_id", foreign = true, canBeNull = false)
	private Exercise exercise;
	
	@DatabaseField(columnName = EXERCISE_RESULT_FIELD_NAME, canBeNull = false)
	private int result;
	
	@DatabaseField(columnName = TIME_FIELD_NAME, canBeNull = false)
	private Date time;
	
	@DatabaseField(columnName = "raw_answer", canBeNull = false)
	private String rawAnswer;
}
