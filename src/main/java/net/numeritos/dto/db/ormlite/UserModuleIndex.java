package net.numeritos.dto.db.ormlite;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

import lombok.Data;

@DatabaseTable(tableName = "user_module_index")
public @Data class UserModuleIndex {
	
	public static final String USER_ID_FIELD_NAME = "user_id";
	
	public static final String MODULE_ID_FIELD_NAME = "module_id";
	
	public static final String CURRENT_INDEX_FIELD_NAME = "current_index";

	@DatabaseField(columnName = USER_ID_FIELD_NAME)
	private int userId;
	
	@DatabaseField(columnName = MODULE_ID_FIELD_NAME)
	private int moduleId;
	
	@DatabaseField(columnName = CURRENT_INDEX_FIELD_NAME)
	private int currentIndex;
}
