package net.numeritos.struts.actions;

import org.apache.struts2.interceptor.parameter.StrutsParameter;

import org.apache.struts2.action.Action;

import lombok.Getter;
import lombok.Setter;
import net.numeritos.constants.ExerciseResult;
import net.numeritos.constants.SessionKeys;
import net.numeritos.dto.presentation.ExerciseDto;
import net.numeritos.service.AnswerProcessingService;
import net.numeritos.service.ExercisesService;

public class ExerciseCheckAction extends BaseAction {

	/**
	 * Serial Version UID.
	 */
	private static final long serialVersionUID = -4625045519156199938L;
	
	@Getter
	@Setter
	private ExercisesService exercisesService;
	
	@Getter
	@Setter
	private AnswerProcessingService answerProcessingService;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private String answer;
	
	@Getter
	@Setter
	private int resultCode;
	
	@Getter
	@Setter
	private ExerciseDto exercise;
	
	@Override
	public String execute() throws Exception {
		
		// Get and erase exercise from session.
		ExerciseDto exercise = (ExerciseDto) this.getSession().get(SessionKeys.EXERCISE);
		this.getSession().remove(SessionKeys.EXERCISE);
		
		// Record answer
		ExerciseResult result = this.exercisesService.checkAndRecordAnswer(this.getUser(), answer, exercise);
		
		this.resultCode = result.getIntCode();
		this.exercise = exercise;
		
		return Action.SUCCESS;
	}
	
	@Override
	public void validate() {
		// Get exercise type from session.
		ExerciseDto exercise = (ExerciseDto) this.getSession().get(SessionKeys.EXERCISE);
		if (!this.answerProcessingService.validAnswerFormat(this.answer, exercise.getType())) {
			// TODO. Add proper action errors
			this.addActionError(this.getText("error.wrong.format"));
		}
	}
}
