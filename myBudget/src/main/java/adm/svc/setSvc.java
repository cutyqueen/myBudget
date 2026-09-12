package adm.svc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import adm.dto.noticeDto;
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
            String sql = "/* adm/svc/setSvc */\n" +
        				 "UPDATE USERS " +
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
    
//회계기간 조회
public userDto getAccountingPeriod(String userId) {
    Connection conn = null;
    PreparedStatement pstmt = null;
    java.sql.ResultSet rs = null;
    userDto user = null;
    try {
        conn = DBConn.getConnection();
        String sql = "/* adm/svc/setSvc */\n" +
        			 "SELECT set_year, set_month " +
                     "FROM USERS " +
                     "WHERE user_id = ?";

        DBConn.logSql(sql, userId);
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

//메뉴별 공지사항조회
public List<noticeDto> getNoticeByMenu(String noticeMenu) {

	String sql = "/* setSvc.getNoticeByMenu */\n" +
            "SELECT NOTICE_ID,\n" +
            "       TITLE,\n" +
            "       CONTENT,\n" +
            "       POSITION\n" +
            "  FROM NOTICE\n" +
            " WHERE NOTICE_MENU = UPPER(?)\n" +
            "   AND USE_YN = 'Y'\n" +
            " ORDER BY CASE POSITION\n" +
            "              WHEN 'TOP' THEN 1\n" +
            "              WHEN 'MID' THEN 2\n" +
            "              WHEN 'BOTTOM' THEN 3\n" +
            "              ELSE 4\n" +
            "          END";

    DBConn.logSql(sql, noticeMenu);

    List<noticeDto> noticeList = new ArrayList<>();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {

        conn = DBConn.getConnection();
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, noticeMenu);

        rs = pstmt.executeQuery();

        while(rs.next()) {

            noticeDto notice = new noticeDto();

            notice.setTitle(rs.getString("TITLE"));
            notice.setContent(rs.getString("CONTENT"));
            notice.setPosition(rs.getString("POSITION"));


            noticeList.add(notice);
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return noticeList;
}
    
}