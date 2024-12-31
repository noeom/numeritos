package net.numeritos.struts.actions;

import java.util.Map;

import org.apache.struts2.action.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;
import net.numeritos.dto.presentation.UserDto;
import net.numeritos.struts.interfaces.UserAware;
import net.numeritos.viewMapping.ExerciseTypeConstants;

public abstract class BaseAction extends ActionSupport implements SessionAware, UserAware {

	/**
	 * Serial version ID.
	 */
	private static final long serialVersionUID = -1038074155312747945L;
	
	@Getter
	@Setter
	private Map<String, Object> session;
	
	@Getter
	@Setter
	private UserDto user;

	public String getTextParams(String key, String... params) {
		return getText(key, params);
	}
	
	@Override
	public void withSession(Map<String, Object> session) {
		this.session = session;
	}
	
	protected String choosePresentation(int exerciseType) {
		switch (exerciseType) {
		case ExerciseTypeConstants.SIMPLE_FRACTION_OPERATION:
			return "simple_fraction_op";
		case ExerciseTypeConstants.SIMPLE_TRANSPOSITION_EQUATION:
			return "first_deg_eq";
		case ExerciseTypeConstants.GENERATING_FRACTION_OPERATION:
			return "generating_fraction";
		// The most common case.
		default:
			return "simple_op";
		}
	}	
}
