package net.numeritos.service.impl;

import org.mindrot.jbcrypt.BCrypt;

import net.numeritos.service.CryptoService;

public class BCryptCryptoServiceImpl implements CryptoService {

	@Override
	public String hashPassword(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt());
	}

	@Override
	public String hashPassword(String password, String salt) {
		return BCrypt.hashpw(password, salt);
	}

	@Override
	public boolean checkPassword(String plain, String hash) {
		return BCrypt.checkpw(plain, hash);
	}

}
