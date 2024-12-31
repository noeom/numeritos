package net.numeritos.struts.actions;

import org.apache.struts2.interceptor.parameter.StrutsParameter;

import com.opensymphony.xwork2.Action;

import lombok.Getter;
import lombok.Setter;
import net.numeritos.dto.presentation.ResultsDto;
import net.numeritos.service.declaration.ExerciseActivityService;

public class JsonStatsAction extends BaseAction {

	/*
	 * Serial version ID.
	 */
	private static final long serialVersionUID = -6946348365435904273L;
	
	@Getter
	@Setter
	private ResultsDto results;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private int moduleId;
	
	@Getter(onMethod_={@StrutsParameter})
	@Setter(onMethod_={@StrutsParameter})
	private int timeLapse;
	
	private ExerciseActivityService exerciseActivityService;

	@Override
	public String execute() throws Exception {
		results = exerciseActivityService.getResults(this.getUser().getId(), moduleId, timeLapse);
		return Action.SUCCESS;
	}
}
