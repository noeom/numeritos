package net.numeritos.service.impl;

import net.numeritos.constants.ExerciseResult;
import net.numeritos.dto.presentation.ExerciseDto;
import net.numeritos.utils.math.Fraction;
import net.numeritos.viewMapping.ExerciseTypeConstants;

public class AnswerProcessingServiceImpl implements net.numeritos.service.AnswerProcessingService {

	@Override
	public boolean validAnswerFormat(String answer, int exerciseType) {
		
		switch(exerciseType) {
		case ExerciseTypeConstants.SIMPLE_FRACTION_OPERATION:
		case ExerciseTypeConstants.GENERATING_FRACTION_OPERATION:
			return checkFractionFormat(answer);
		default:
			return checkIntegerFormat(answer);
		}
	}
	
	@Override
	public ExerciseResult checkAnswer(String Answer, ExerciseDto exercise) {
		switch(exercise.getType()) {
		case ExerciseTypeConstants.SIMPLE_FRACTION_OPERATION:
		case ExerciseTypeConstants.GENERATING_FRACTION_OPERATION:
			return checkFractionAnswer(Answer, exercise.getSolution());
		default:
			return checkIntegerAnswer(Answer, exercise.getSolution());
		}
	}
	
	private boolean checkIntegerFormat(String answer) {
		try {
			Integer.parseInt(answer);
		} catch (NumberFormatException nfe) {
			return false;
		}
		return true;		
	}
	
	private boolean checkFractionFormat(String answer) {
		// A fraction result can be an integer (simplified)
		if (checkIntegerFormat(answer)) return true;
		
		if (!answer.contains("/")) return false;
		
		String[] fields = answer.split("/");
		
		if (!checkIntegerFormat(fields[0]) || !checkIntegerFormat(fields[1])) return false;
		
		if (Integer.valueOf(fields[1]).equals(0)) return false;
		
		return true;
	}
	
	private ExerciseResult checkIntegerAnswer(String answer, String solution) {
		int IntAnswer = Integer.parseInt(answer);
		int intSolution = Integer.parseInt(solution);
		return IntAnswer == intSolution ? ExerciseResult.RIGHT : ExerciseResult.WRONG;
	}
	
	private ExerciseResult checkFractionAnswer(String answer, String solution) {
		
		if (answer.contains("/") && solution.contains("frac")) { // Both are fractions.
			Fraction solFrac = Fraction.fromLatex(solution);
			Fraction ansFrac = Fraction.fromText(answer);
			
			if (solFrac.equals(ansFrac)) return ExerciseResult.RIGHT;
			if (solFrac.equivalent(ansFrac)) return ExerciseResult.DIDNT_SIMPLIFY;
			return ExerciseResult.WRONG;			
		}
		
		if (!answer.contains("/") && solution.contains("frac")) {// User reduced the fraction when it couldn't be reduced.
			return ExerciseResult.WRONG;
		}
		
		if (answer.contains("/") && !solution.contains("frac")) { //User dind't reduce the fraction?
			Fraction ansFrac = Fraction.fromText(answer);
			Fraction solFrac = new Fraction(Integer.valueOf(solution), 1);
			if (ansFrac.equivalent(solFrac)) return ExerciseResult.DIDNT_SIMPLIFY;
			return ExerciseResult.WRONG;
		}
		
		// Both are numbers.
		if (answer.equals(solution)) return ExerciseResult.RIGHT;
		return ExerciseResult.WRONG;
	}
}
