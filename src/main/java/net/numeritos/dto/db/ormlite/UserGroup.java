package net.numeritos.dto.db.ormlite;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

import lombok.Data;

@DatabaseTable(tableName = "user_groups")
public @Data class UserGroup {

	@DatabaseField(generatedId = true)
	private Integer id;
	
	@DatabaseField(canBeNull = false)
	private String name;
	
	@DatabaseField(foreignAutoRefresh=true, foreign = true, canBeNull = false, columnName = "org_id")
	private Organization organization;
}
