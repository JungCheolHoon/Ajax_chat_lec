package util;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Throwable e) {
			throw new ExceptionInInitializerError(e);
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/chat?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8&useSSL=false",
				"root", "root");
	}
}