package adm.dao;
import adm.com.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import adm.dto.noticeDto;

public class noticeDao {

    public List<noticeDto> selectNoticeList(String noticeMenu) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<noticeDto> list = new ArrayList<>();

        try {
            conn = DBConn.getConnection();
            String sql = "SELECT NOTICE_ID,\n" +
                    "       TITLE,\n" +
                    "       CONTENT,\n" +
                    "       NOTICE_MENU,\n" +
                    "       USE_YN,\n" +
                    "       CREAT_DT,\n" +
                    "       MODIFY_DT\n" +
                    "  FROM NOTICE\n" +
                    " ORDER BY CREAT_DT DESC";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, noticeMenu);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                noticeDto dto = new noticeDto();

                dto.setNoticeId(rs.getString("NOTICE_ID"));
                dto.setTitle(rs.getString("TITLE"));
                dto.setContent(rs.getString("CONTENT"));
                dto.setNoticeMenu(rs.getString("NOTICE_MENU"));
                dto.setSort(rs.getString("SORT"));
                dto.setUseYn(rs.getString("USE_YN"));
                dto.setCreatDt(rs.getString("CREAT_DT"));
                dto.setModifyDt(rs.getString("MODIFY_DT"));

                list.add(dto);
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

    public noticeDto selectNotice(String noticeId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        noticeDto dto = null;

        try {
            conn = DBConn.getConnection();
            String sql = "SELECT * FROM notice WHERE notice_id = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, noticeId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new noticeDto();
                dto.setNoticeId(rs.getString("notice_id"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setNoticeMenu(rs.getString("notice_menu"));
                dto.setSort(rs.getString("sort"));
                dto.setUseYn(rs.getString("use_yn"));
                dto.setCreatDt(rs.getString("creat_dt"));
                dto.setModifyDt(rs.getString("modify_dt"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e2) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception e2) {}
            try { if (conn != null) conn.close(); } catch (Exception e2) {}
        }

        return dto;
    }

    public int insertNotice(noticeDto dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            conn = DBConn.getConnection();
            String sql = "INSERT INTO notice (notice_id, title, content, notice_menu, sort, use_yn) " +
                         "VALUES (notice_seq.NEXTVAL, ?, ?, ?, ?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getNoticeMenu());
            pstmt.setString(4, dto.getSort());
            pstmt.setString(5, dto.getUseYn());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception e2) {}
            try { if (conn != null) conn.close(); } catch (Exception e2) {}
        }

        return result;
    }

    public int updateNotice(noticeDto dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            conn = DBConn.getConnection();
            String sql = "UPDATE notice SET title = ?, content = ?, notice_menu = ?, sort = ?, use_yn = ?, modify_dt = SYSDATE " +
                         "WHERE notice_id = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getNoticeMenu());
            pstmt.setString(4, dto.getSort());
            pstmt.setString(5, dto.getUseYn());
            pstmt.setString(6, dto.getNoticeId());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception e2) {}
            try { if (conn != null) conn.close(); } catch (Exception e2) {}
        }

        return result;
    }

    public int deleteNotice(String noticeId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            conn = DBConn.getConnection();
            String sql = "DELETE FROM notice WHERE notice_id = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, noticeId);

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception e2) {}
            try { if (conn != null) conn.close(); } catch (Exception e2) {}
        }

        return result;
    }
}