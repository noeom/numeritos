package net.numeritos.service;

public interface CryptoService {

	public String hashPassword(String password);
	
	public String hashPassword(String password, String salt);
	
	public boolean checkPassword(String plain, String hash);
}
