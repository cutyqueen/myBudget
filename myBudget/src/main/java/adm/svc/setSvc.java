package adm.svc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import adm.dto.catDto;
import adm.dto.catGroupDto;
import adm.dto.noticeDto;
import adm.dto.userDto;
import adm.com.DBConn;
import adm.dao.catDao;
import adm.dao.userDao;


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
public userDto getAccDate(String userId) {
    Connection conn = null;
    PreparedStatement pstmt = null;
    java.sql.ResultSet rs = null;
    userDto user = null;
    try {
        conn = DBConn.getConnection();
        String sql = "/* setSvc.getAccDate */\n" +
        			"SELECT set_year,\n" +
        	        "       set_month\n" +
        	        "FROM USERS\n" +
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


// 회계 기준일 업데이트
private userDao userDao = new userDao();
public int updateAccDate(String userId, String setYear, String setMonth) {

    // 1) 검증
    if (userId == null || userId.trim().isEmpty()) {
        throw new IllegalArgumentException("사용자 ID 가 없습니다.");
    }
    if (setYear == null || !setYear.matches("\\d{4}")) {
        throw new IllegalArgumentException("년도 형식이 올바르지 않습니다.");
    }
    if (setMonth == null || !setMonth.matches("0[1-9]|1[0-2]")) {
        throw new IllegalArgumentException("월 형식이 올바르지 않습니다.");
    }

    // 2) DAO 호출
    return userDao.updateAccDate(userId, setYear.trim(), setMonth.trim());
}

//가계부설정-카테고리 조회
public List<catGroupDto> groupCategory(List<catDto> list){
    List<catGroupDto> groupList = new ArrayList<>();

    for(catDto cat : list){
        catGroupDto group = null;

        for(catGroupDto g : groupList){
            if(g.getCatType().equals(cat.getCatType()) && g.getCatNm().equals(cat.getCatNm())){
                group = g;
                break;
            }
        }

        if(group == null){
            group = new catGroupDto();
            group.setCatType(cat.getCatType());
            group.setCatNm(cat.getCatNm());
            group.setSubList(new ArrayList<>());
            groupList.add(group);
        }

        boolean exists = false;

        for(catDto sub : group.getSubList()){
            if(sub.getSubCatNm().equals(cat.getSubCatNm())){
                exists = true;
                break;
            }
        }

        if(!exists){
            group.getSubList().add(cat);
        }
    }

    return groupList;
}

//가계부설정-카테고리 대분류 추가
private catDao catDao;

public setSvc(){
    catDao = new catDao();
}
public int insertCatNm(String userId, String catType, String catNm){
    return catDao.insertCatNm(userId, catType, catNm);
}

//가계부설정-카테고리 소분류 추가
public int insertSubCat(String userId,String catType,String catNm,String subCatNm,String fixYn){
    return catDao.insertSubCat(userId,catType,catNm,subCatNm,fixYn);
}

//가계부설정-카테고리 소분류 저장
public int updateCategory(String userId, String[] catIdList, String[] subCatNmList, String[] fixYnList){ 
	return catDao.updateCategory(userId, catIdList, subCatNmList, fixYnList); 
}
}