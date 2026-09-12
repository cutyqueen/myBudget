package adm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import adm.com.DBConn;
import adm.dto.userDto;

public class userDao {

	/* 로그인 - 회원정보 확인*/
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
    
    /* 회원가입 */
    public int insertUser(userDto user) {
        String sql =
        	    "/* userDao.insertUser */\n" +
        	    "INSERT INTO USERS (\n" +
        	    "    USER_ID,\n" +
        	    "    USER_NM,\n" +
        	    "    PW,\n" +
        	    "    EMAIL,\n" +
        	    "    MBPNO,\n" +
        	    "    SET_YEAR,\n" +
        	    "    SET_MONTH,\n" +
        	    "    BEGIN_DT,\n" +
        	    "    STATUS,\n" +
        	    "    CREAT_DT,\n" +
        	    "    MODIFY_DT\n" +
        	    ") VALUES (\n" +
        	    "    ?, ?, ?, ?, ?,\n" +
        	    "    TO_CHAR(SYSDATE, 'YYYY'),\n" +
        	    "    TO_CHAR(SYSDATE, 'MM'),\n" +
        	    "    SYSDATE,\n" +
        	    "    '01',\n" +
        	    "    SYSDATE,\n" +
        	    "    SYSDATE\n" +
        	    ")";
        DBConn.logSql(sql.toString(), user.getUserId(), user.getUserNm(), user.getPw(), user.getEmail(), user.getMbpno());
        try (
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt =
                    conn.prepareStatement(sql.toString())
        ) {
            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getUserNm());
            pstmt.setString(3, user.getPw());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getMbpno());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
	/* 시스템관리 - 사용자 조회 */
    public List<userDto> selectAllUsers() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<userDto> list = new ArrayList<>();

        try {
            conn = DBConn.getConnection();
            String sql = "SELECT A.USER_ID,\n" +
                    "       A.USER_NM,\n" +
                    "       NVL(A.EMAIL, '미입력') AS EMAIL,\n" +
                    "       NVL(A.MBPNO, '미입력') AS MBPNO,\n" +
                    "       NVL(A.SET_YEAR, '미입력') AS SET_YEAR,\n" +
                    "       NVL(A.SET_MONTH, '미입력') AS SET_MONTH,\n" +
                    "       TO_CHAR(A.BEGIN_DT, 'YYYY-MM-DD') AS BEGIN_DT,\n" +
                    "       A.STATUS,\n" +
                    "       FN_CDNM('USER_STATUS', A.STATUS) AS STATUS_NM,\n" +
                    "       A.CREAT_DT\n" +
                    "  FROM USERS A\n" +
                    " ORDER BY A.CREAT_DT DESC";

            DBConn.logSql(sql);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                userDto user = new userDto();
                user.setUserId(rs.getString("user_id"));
                user.setUserNm(rs.getString("user_nm"));
                user.setEmail(rs.getString("email"));
                user.setMbpno(rs.getString("mbpno"));
                user.setSetYear(rs.getString("set_year"));
                user.setSetMonth(rs.getString("set_month"));
                user.setBeginDt(rs.getString("begin_dt"));
                user.setStatus(rs.getString("status"));
                user.setStatusNm(rs.getString("status_nm"));
                list.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e2) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception e2) {}
            try { if (conn != null) conn.close(); } catch (Exception e2) {}
        }

        return list;
    }
    
    /* 가계부 설정 - 회계기준일 저장 */
    public int updateAccDate(String userId, String setYear, String setMonth) {
        String sql = "/* userDao.updateAccDate */\n" +
                     "UPDATE USERS\n" +
                     "   SET SET_YEAR = ?,\n" +
                     "       SET_MONTH = ?,\n" +
                     "       MODIFY_DT = SYSDATE\n" +
                     " WHERE USER_ID = ?";
        DBConn.logSql(sql, new Object[]{setYear, setMonth, userId});
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBConn.getConnection();
            pstmt = conn.prepareStatement(sql);
            int idx = 1;
            pstmt.setString(idx++, setYear);
            pstmt.setString(idx++, setMonth);
            pstmt.setString(idx++, userId);
            
            int result = pstmt.executeUpdate();
            System.out.println("UPDATE 완료");
            System.out.println("UPDATE COUNT = " + result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception e2) {}
            try { if (conn != null) conn.close(); } catch (Exception e2) {}
        }
    }
}