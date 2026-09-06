package adm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import adm.com.DBConn;
import adm.dto.userDto;

public class userDao {

    public boolean authenticate(String userId, String userPassword) {
        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT COUNT(*) ");
        sql.append("   FROM USERS ");
        sql.append("  WHERE USER_ID = ? ");
        sql.append("    AND PW = ? ");

        try (
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt =
                    conn.prepareStatement(sql.toString())
        ) {
            pstmt.setString(1, userId);
            pstmt.setString(2, userPassword);

            try (
                ResultSet rs = pstmt.executeQuery()
            ) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public int insertUser(userDto user) {
        StringBuilder sql = new StringBuilder();

        sql.append(" INSERT INTO USERS ( ");
        sql.append("     USER_ID, ");
        sql.append("     USER_NM, ");
        sql.append("     PW, ");
        sql.append("     EMAIL, ");
        sql.append("     MBPNO, ");
        sql.append("     BEGIN_DT, ");
        sql.append("     STATUS, ");
        sql.append("     CREAT_DT, ");
        sql.append("     MODIFY_DT ");
        sql.append(" ) VALUES ( ");
        sql.append("     ?, ?, ?, ?, ?, ");
        sql.append("     SYSDATE, '1', SYSDATE, SYSDATE ");
        sql.append(" ) ");

        try (
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt =
                    conn.prepareStatement(sql.toString())
        ) {
            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getUserNm());
            pstmt.setString(3, user.getPw());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getMbpn());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}