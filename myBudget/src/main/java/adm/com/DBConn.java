package adm.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class DBConn {

    public static Connection getConnection() throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
        
        Properties props = new Properties();
        props.setProperty("user", "MYBUDGET");
        props.setProperty("password", "mybudget1234");
        props.setProperty("oracle.jdbc.defaultNChar", "true");

        Connection conn = DriverManager.getConnection(url, props);
        return conn;
    }

    // SQL 로그 출력용 메서드 추가
    public static void logSql(String sql, Object... params) {
        System.out.println("/*======== SQL ========*/");
        System.out.println(sql);
        if (params != null && params.length > 0) {
            System.out.print("Parameters: ");
            for (int i = 0; i < params.length; i++) {
                System.out.print("[" + (i + 1) + "]=" + params[i] + " ");
            }
            System.out.println();
        }
        System.out.println("/*=====================*/");
    }
}