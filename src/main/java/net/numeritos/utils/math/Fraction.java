package net.numeritos.utils.math;

public class Fraction {

	private int num;
	
	private int den;
	
	public Fraction(int n, int d) {
		if (d == 0) throw new NumberFormatException("Fraction denominator cannot be zero.");
		this.num = n;
		this.den = d;
	}
	
	public Fraction add(Fraction another) {
		int common_den = this.den * another.den;
		return new Fraction(another.num * this.den + another.den * this.num, common_den).simplify();
	}
	
	public Fraction substract(Fraction another) {
		int common_den = this.den * another.den;
		return new Fraction(- another.num * this.den + another.den * this.num, common_den).simplify();
	}
	
	public Fraction multiply(Fraction another) {
		return new Fraction(another.num * this.num, another.den * this.den).simplify();
	}
	
	public Fraction divide(Fraction another) {
		return new Fraction(this.num * another.den, this.den * another.num).simplify();
	}	
	
	public Fraction simplify() {
		int gcd = gcd(this.num, this.den);
		
		if (this.num <0 && this.den < 0) {
			return new Fraction(-this.num/gcd, -this.den/gcd);
		}
		if (this.num * this.den < 0) {
			return new Fraction(-Math.abs(this.num)/gcd, Math.abs(this.den)/gcd);
		}
		return new Fraction(this.num/gcd, this.den/gcd);
	}
	
	public String toLatex() {
		if (this.den == 1) return String.valueOf(num);
		return "\\frac{"+num+"}{"+den+"}";
	}
	
	@Override
	public String toString() {
		return this.toLatex();
	}
	
	public static Fraction fromLatex(String latex) {
		String[] fields = latex.split("\\}\\{");
		String strNum = fields[0].split("\\{")[1];
		String strDen = fields[1].split("\\}")[0];
		return new Fraction(Integer.valueOf(strNum), Integer.valueOf(strDen));
	}
	
	public static Fraction fromText(String text) {
		String[] fields = text.split("/");
		return new Fraction(Integer.valueOf(fields[0]), Integer.valueOf(fields[1]));
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj ==  null) return false;
		if (!(obj instanceof Fraction)) return false;
		
		Fraction another = (Fraction)obj;
		return this.num == another.num && this.den == another.den;
	}
	
	public boolean equivalent(Fraction another) {
		return this.simplify().equals(another.simplify());
	}
	
	private int gcd(int a, int b) {
		if (b == 0) return Math.abs(a);
		return Math.abs(gcd(b, a%b));
	}
	
	public boolean isInteger() {
		return this.simplify().den == 1;
	}
	
	public int getNum() {
		return num;
	}

	public int getDen() {
		return den;
	}	
}
