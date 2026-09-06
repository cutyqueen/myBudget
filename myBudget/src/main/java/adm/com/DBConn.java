package adm.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {

    private static final String DRIVER =
            "oracle.jdbc.OracleDriver";

    private static final String URL =
            "jdbc:oracle:thin:@localhost:1521/XEPDB1";

    private static final String USER =
            "MYBUDGET";

    private static final String PASSWORD =
            "mybudget1234";

    static {
        try {
            Class.forName(DRIVER);
            System.out.println("Oracle JDBC Driver 로딩 성공");
        } catch (ClassNotFoundException e) {
            System.out.println("Oracle JDBC Driver 로딩 실패");
            e.printStackTrace();
            throw new RuntimeException(
                    "Oracle JDBC Driver 로딩 실패",
                    e
            );
        }
    }

    public static Connection getConnection()
            throws SQLException {

        System.out.println("DB 연결 시도: " + URL);
        System.out.println("사용자: " + USER);

        Connection conn = DriverManager.getConnection(
                URL,
                USER,
                PASSWORD
        );

        System.out.println("DB 연결 성공");

        return conn;
    }
}