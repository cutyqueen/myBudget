package adm.svc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import adm.dto.noticeDto;
import adm.com.DBConn;

public class noticeSvc {

    // 공지사항 목록 조회
    public List<noticeDto> selectNoticeList(String noticeMenu) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<noticeDto> list = new ArrayList<>();

        try {
            conn = DBConn.getConnection();
            String sql = "/* adm/svc/noticeSvc */\n" +
                    "SELECT A.NOTICE_ID,\n" +
                    "       A.NOTICE_MENU,\n" +
                    "       B.VAL_NM AS USE_MENU,\n" +
                    "       A.TITLE,\n" +
                    "       A.CONTENT,\n" +
                    "       A.USE_YN,\n" +
                    "       A.CREAT_DT,\n" +
                    "       A.MODIFY_DT\n" +
                    "  FROM NOTICE A,\n" +
                    "       COCD B\n" +
                    " WHERE A.NOTICE_MENU = B.VAL_CD(+)\n" +
                    "   AND B.UP_CD(+) = 'NOTICE'\n" +
                    "   AND B.LOW_CD(+) = 'MENU'";

            DBConn.logSql(sql, noticeMenu);

            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                noticeDto notice = new noticeDto();

                notice.setNoticeId(rs.getString("NOTICE_ID"));
                notice.setNoticeMenu(rs.getString("NOTICE_MENU"));
                notice.setUseMenu(rs.getString("USE_MENU"));
                notice.setTitle(rs.getString("TITLE"));
                notice.setContent(rs.getString("CONTENT"));
                notice.setUseYn(rs.getString("USE_YN"));
                notice.setCreatDt(rs.getString("CREAT_DT"));
                notice.setModifyDt(rs.getString("MODIFY_DT"));

                list.add(notice);
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

        return list;
    }


    // 공지사항 상세 조회
    public noticeDto selectNotice(String noticeId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        noticeDto notice = null;

        try {
            conn = DBConn.getConnection();
            String sql = "/* adm/svc/noticeSvc */\n" +
                    "SELECT A.NOTICE_ID,\n" +
                    "       A.NOTICE_MENU,\n" +
                    "       B.VAL_NM AS USE_MENU,\n" +
                    "       A.TITLE,\n" +
                    "       A.CONTENT,\n" +
                    "       A.USE_YN,\n" +
                    "       A.CREAT_DT,\n" +
                    "       A.MODIFY_DT\n" +
                    "  FROM NOTICE A,\n" +
                    "       COCD B\n" +
                    " WHERE A.NOTICE_MENU = B.VAL_CD(+)\n" +
                    "   AND B.UP_CD(+) = 'NOTICE'\n" +
                    "   AND B.LOW_CD(+) = 'MENU'";
            DBConn.logSql(sql, noticeId);

            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                notice = new noticeDto();

                notice.setNoticeId(rs.getString("NOTICE_ID"));
                notice.setNoticeMenu(rs.getString("NOTICE_MENU"));
                notice.setUseMenu(rs.getString("USE_MENU"));
                notice.setTitle(rs.getString("TITLE"));
                notice.setContent(rs.getString("CONTENT"));
                notice.setUseYn(rs.getString("USE_YN"));
                notice.setCreatDt(rs.getString("CREAT_DT"));
                notice.setModifyDt(rs.getString("MODIFY_DT"));
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

        return notice;
    }


    // 공지사항 등록
    public int insertNotice(noticeDto notice) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            conn = DBConn.getConnection();

            String sql = "/* adm/svc/noticeSvc */\n" +
                    "INSERT INTO NOTICE (\n" +
                    "       NOTICE_ID,\n" +
                    "       NOTICE_MENU,\n" +
                    "       TITLE,\n" +
                    "       CONTENT,\n" +
                    "       USE_YN,\n" +
                    "       CREAT_DT,\n" +
                    "       MODIFY_DT\n" +
                    ") VALUES (\n" +
                    "       SEQ_NOTICE.NEXTVAL,\n" +
                    "       ?,\n" +
                    "       ?,\n" +
                    "       ?,\n" +
                    "       ?,\n" +
                    "       SYSDATE,\n" +
                    "       SYSDATE\n" +
                    ")";

            DBConn.logSql(
                    sql,
                    notice.getNoticeMenu(),
                    notice.getTitle(),
                    notice.getContent(),
                    notice.getUseYn()
            );

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, notice.getNoticeMenu());
            pstmt.setString(2, notice.getTitle());
            pstmt.setString(3, notice.getContent());
            pstmt.setString(4, notice.getUseYn());

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


    // 공지사항 수정
    public int updateNotice(noticeDto notice) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            conn = DBConn.getConnection();

            String sql = "/* adm/svc/noticeSvc */\n" +
                    "UPDATE NOTICE\n" +
                    "   SET NOTICE_MENU = ?,\n" +
                    "       TITLE = ?,\n" +
                    "       CONTENT = ?,\n" +
                    "       USE_YN = ?,\n" +
                    "       MODIFY_DT = SYSDATE\n" +
                    " WHERE NOTICE_ID = ?";

            DBConn.logSql(
                    sql,
                    notice.getNoticeMenu(),
                    notice.getTitle(),
                    notice.getContent(),
                    notice.getUseYn(),
                    notice.getNoticeId()
            );

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, notice.getNoticeMenu());
            pstmt.setString(2, notice.getTitle());
            pstmt.setString(3, notice.getContent());
            pstmt.setString(4, notice.getUseYn());
            pstmt.setString(5, notice.getNoticeId());

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

    //공지사항 삭제
    public int deleteNotice(String noticeId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            conn = DBConn.getConnection();

            String sql = "/* adm/svc/noticeSvc */\n" +
                    "DELETE FROM NOTICE\n" +
                    " WHERE NOTICE_ID = ?";

            DBConn.logSql(sql, noticeId);

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, noticeId);

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
}