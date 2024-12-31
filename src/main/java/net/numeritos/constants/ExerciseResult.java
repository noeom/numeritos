package net.numeritos.constants;

public enum ExerciseResult {
	RIGHT(1), WRONG(0), DIDNT_SIMPLIFY(2), UNDEFINED(-1);
	
	private final int intCode;
	
	private ExerciseResult(int intCode) {
		this.intCode = intCode;
	}

	public int getIntCode() {
		return intCode;
	}
}
