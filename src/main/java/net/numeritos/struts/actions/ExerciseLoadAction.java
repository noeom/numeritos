package net.numeritos.struts.actions;

import lombok.Getter;
import lombok.Setter;
import net.numeritos.constants.SessionKeys;
import net.numeritos.dto.presentation.ExerciseDto;
import net.numeritos.service.declaration.ExercisesService;

public class ExerciseLoadAction extends BaseAction {

	/**
	 * Serial version ID.
	 */
	private static final long serialVersionUID = -7003202437479876538L;

	@Getter
	@Setter
	private ExercisesService exercisesService;
	
	@Getter
	@Setter
	private ExerciseDto exercise;
	
	@Override
	public String execute() throws Exception {
		
		// Get exercise.
		this.exercise = this.exercisesService.getExerciseForUser(this.getUser());
		
		// Store it in session.
		this.getSession().put(SessionKeys.EXERCISE, this.exercise);
		
		// Show the right presentation for the exercise type.
		return choosePresentation(exercise.getType());
	}
}
