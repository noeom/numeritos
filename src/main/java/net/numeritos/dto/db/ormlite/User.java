package net.numeritos.dto.db.ormlite;

import java.util.Date;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

import lombok.Data;

@DatabaseTable(tableName = "users")
public @Data class User {
	
	public static final String ID_FIELD_NAME="id";
	public static final String EMAIL_FIELD_NAME = "email";
	public static final String PASSWORD_HASH_FIELD_NAME = "password_hash";
	public static final String DEFAULT_MODULE_FIELD_NAME = "default_module";
	public static final String USER_GROUP_FIELD_NAME = "user_group_id";

	@DatabaseField(generatedId = true)
	private Integer id;
	
	@DatabaseField(canBeNull = false)
	private String name;
	
	@DatabaseField(canBeNull = false)
	private String surname;
	
	@DatabaseField(columnName = PASSWORD_HASH_FIELD_NAME, canBeNull = false)
	private String passwordHash;
	
	@DatabaseField(canBeNull = false)	
	private String email;
	
	@DatabaseField(canBeNull = false)
	private boolean admin;
	
	@DatabaseField(canBeNull = false)
	private boolean active;
	
	@DatabaseField(columnName = "expiry_date")
	private Date expiryDate;
	
	@DatabaseField(columnName = DEFAULT_MODULE_FIELD_NAME, canBeNull = false)
	private Integer defaultModule;
	
	@DatabaseField(foreignAutoRefresh=true, foreign = true, canBeNull = false, columnName = USER_GROUP_FIELD_NAME)
	private UserGroup userGroup;
	
}
