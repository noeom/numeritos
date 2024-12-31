package net.numeritos.dto.db.ormlite;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

import lombok.Data;

@DatabaseTable(tableName = "modules")
public @Data class Module {

	@DatabaseField(id = true)
	private int id;
	
	@DatabaseField(columnName = "start_idx")
	private int startIdx;
	
	@DatabaseField(columnName = "end_idx")
	private int endIdx;
}
