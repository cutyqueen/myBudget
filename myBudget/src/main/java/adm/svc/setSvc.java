package adm.svc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import adm.dto.userDto;
import adm.com.DBConn;

public class setSvc {

    public int updateAccountingPeriod(
            String userId,
            String setYear,
            String setMonth
    ) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            conn = DBConn.getConnection();

            String sql = "UPDATE USERS " +
                         "SET set_year = ?, " +
                         "    set_month = ?, " +
                         "    MODIFY_DT = SYSDATE " +
                         "WHERE user_id = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, setYear);
            pstmt.setString(2, setMonth);
            pstmt.setString(3, userId);

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e2) {}
            try {
                if (conn != null) conn.close();
            } catch (Exception e2) {}
        }

        return result;
    }

    public userDto getAccountingPeriod(String userId) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        java.sql.ResultSet rs = null;
        userDto user = null;

        try {
            conn = DBConn.getConnection();

            String sql = "SELECT set_year, set_month " +
                         "FROM USERS " +
                         "WHERE user_id = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new userDto();
                user.setSetYear(rs.getString("set_year"));
                user.setSetMonth(rs.getString("set_month"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception e2) {}
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e2) {}
            try {
                if (conn != null) conn.close();
            } catch (Exception e2) {}
        }

        return user;
    }
}