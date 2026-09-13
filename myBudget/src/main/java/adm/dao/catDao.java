package adm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import adm.com.DBConn;
import adm.dto.catDto;

public class catDao {

    /* 회원가입 시 카테고리 생성 */
    public int insertCategory(String userId) {

        String sql =
                "/* catDao.insertCategory */\n" +
                "INSERT INTO CATEGORY ( " +
                " CAT_ID, " +
                " USER_ID, " +
                " CAT_TYPE, " +
                " CAT_NM, " +
                " SUB_CAT_NM, " +
                " FIX_YN, " +
                " USE_YN, " +
                " CREAT_DT, " +
                " MODIFY_DT " +
                ") VALUES ( " +
                " (SELECT NVL(MAX(CAT_ID),0)+1 FROM CATEGORY), " +
                " ?, ?, ?, ?, ?, 'Y', SYSDATE, SYSDATE " +
                ")";

        String[][] categoryList = {
                {"ASSET","현금·예금","현금","N"},
                {"ASSET","현금·예금","보통예금","N"},
                {"ASSET","현금·예금","CMA","N"},
                {"ASSET","저축·투자","예적금","N"},
                {"ASSET","저축·투자","주식","N"},
                {"ASSET","저축·투자","채권","N"},
                {"ASSET","부동산","아파트","N"},
                {"ASSET","기타자산","자동차","N"},

                {"DEBT","신용카드","일시불","N"},
                {"DEBT","신용카드","할부","N"},
                {"DEBT","장기부채","주택담보대출","N"},

                {"INCOME","근로소득","월급","Y"},
                {"INCOME","근로소득","보너스","N"},
                {"INCOME","사업소득","유튜브소득","N"},
                {"INCOME","금융소득","이자소득","N"},

                {"EXPENSE","주거비","주택담보대출이자","Y"},
                {"EXPENSE","주거비","관리비","Y"},
                {"EXPENSE","주거비","전기세","N"},
                {"EXPENSE","식비","식자재구입비","N"},
                {"EXPENSE","식비","배달식비","N"},
                {"EXPENSE","식비","간식비","N"},
                {"EXPENSE","교통비","대중교통","N"},
                {"EXPENSE","교통비","택시비","N"}
        };

        int result = 0;

        try (
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {

            for (String[] category : categoryList) {

                DBConn.logSql(sql, userId, category[0], category[1], category[2], category[3]);

                pstmt.setString(1, userId);
                pstmt.setString(2, category[0]);
                pstmt.setString(3, category[1]);
                pstmt.setString(4, category[2]);
                pstmt.setString(5, category[3]);

                result += pstmt.executeUpdate();

                System.out.println("CATEGORY INSERT RESULT = " + result);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    
    public List<catDto> findCategory(String userId) {

        List<catDto> list = new ArrayList<>();

        String sql =
            "/* catDao.findCategory */\n" +
            "SELECT CAT_ID,\n" +
            "       USER_ID,\n" +
            "       CAT_TYPE,\n" +
            "       CAT_NM,\n" +
            "       SUB_CAT_NM,\n" +
            "       FIX_YN,\n" +
            "       USE_YN\n" +
            "  FROM CATEGORY\n" +
            " WHERE USER_ID = ?\n" +
            "   AND USE_YN = 'Y'\n" +
            " ORDER BY 3, 4 DESC";


        try(
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ){

            DBConn.logSql(sql,userId);

            pstmt.setString(1,userId);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()){

                catDto cat = new catDto();

                cat.setCatId(rs.getString("CAT_ID"));
                cat.setCatType(rs.getString("CAT_TYPE"));
                cat.setCatNm(rs.getString("CAT_NM"));
                cat.setSubCatNm(rs.getString("SUB_CAT_NM"));
                cat.setFixYn(rs.getString("FIX_YN"));

                list.add(cat);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
    
    //가계부설정-카테고리 대분류 추가
    public int insertCatNm(String userId, String catType, String catNm){

        String sql =
            "/* catDao.insertCatNm */\n" +
            "INSERT INTO CATEGORY ("+
            " CAT_ID,"+
            " USER_ID,"+
            " CAT_TYPE,"+
            " CAT_NM,"+
            " SUB_CAT_NM,"+
            " FIX_YN,"+
            " USE_YN,"+
            " CREAT_DT,"+
            " MODIFY_DT"+
            ") VALUES ("+
            " (SELECT NVL(MAX(CAT_ID),0)+1 FROM CATEGORY),"+
            " ?,?,?,?,?, 'Y', SYSDATE, SYSDATE"+
            ")";

        int result = 0;

        try(
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ){

            DBConn.logSql(sql,userId,catType,catNm,"소분류 항목 입력","N");

            pstmt.setString(1,userId);
            pstmt.setString(2,catType);
            pstmt.setString(3,catNm);
            pstmt.setString(4,"소분류 항목 입력");
            pstmt.setString(5,"N");

            result = pstmt.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

        return result;
    }
    //가계부설정-카테고리 소분류 추가
    public int insertSubCat(String userId, String catType, String catNm, String subCatNm, String fixYn){

    	String sql =
	        "/* catDao.insertSubCat */\n" +
	        "INSERT INTO CATEGORY (\n" +
	        "    CAT_ID,\n" +
	        "    USER_ID,\n" +
	        "    CAT_TYPE,\n" +
	        "    CAT_NM,\n" +
	        "    SUB_CAT_NM,\n" +
	        "    FIX_YN,\n" +
	        "    USE_YN,\n" +
	        "    CREAT_DT,\n" +
	        "    MODIFY_DT\n" +
	        ") VALUES (\n" +
	        "    (SELECT NVL(MAX(CAT_ID),0)+1 FROM CATEGORY),\n" +
	        "    ?, ?, ?, ?, ?, 'Y', SYSDATE, SYSDATE\n" +
	        ")";
        int result = 0;

        try(
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ){

            DBConn.logSql(sql,userId,catType,catNm,subCatNm,fixYn);

            pstmt.setString(1,userId);
            pstmt.setString(2,catType);
            pstmt.setString(3,catNm);
            pstmt.setString(4,subCatNm);
            pstmt.setString(5,fixYn);

            result = pstmt.executeUpdate();

            System.out.println("SUB CATEGORY INSERT RESULT = " + result);

        }catch(Exception e){
            e.printStackTrace();
        }

        return result;
    }
    //가계부설정-카테고리 소분류 저장
    public int updateCategory(
            String userId,
            String[] catIdList,
            String[] subCatNmList,
            String[] fixYnList
    ){

        int result = 0;

        String sql =
            "/* catDao.updateCategory */\n" +
            "UPDATE CATEGORY \n" +
            "SET SUB_CAT_NM = ?, \n" +
            "    FIX_YN = ?, \n" +
            "    MODIFY_DT = SYSDATE \n" +
            "WHERE USER_ID = ? \n" +
            "AND CAT_ID = ?";


        try(
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ){

            for(int i=0; i<catIdList.length; i++){

                System.out.println(
                    "index=" + i +
                    " / catId=" + catIdList[i] +
                    " / subCatNm=" + subCatNmList[i] +
                    " / fixYn=" + fixYnList[i]
                );

                pstmt.setString(1, subCatNmList[i]);
                pstmt.setString(2, fixYnList[i]);
                pstmt.setString(3, userId);
                pstmt.setString(4, catIdList[i]);

                result += pstmt.executeUpdate();

                DBConn.logSql(
                    sql,
                    subCatNmList[i],
                    fixYnList[i],
                    userId,
                    catIdList[i]
                );
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return result;
    }
//카테고리 소분류 삭제
    public int deleteSubCat(String userId,String catId){

        String sql =
        "/* catDao.deleteSubCat */\n" +
        "DELETE FROM CATEGORY " +
        "WHERE USER_ID = ? " +
        "AND CAT_ID = ?";

        int result = 0;

        try(
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ){

            DBConn.logSql(sql,userId,catId);

            pstmt.setString(1,userId);
            pstmt.setString(2,catId);

            result = pstmt.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

        return result;
    }
//카테고리 대분류 삭제
    public int deleteCat(String userId,String catNm){

        String sql =
        "/* catDao.deleteCat */\n" +
        "DELETE FROM CATEGORY " +
        "WHERE USER_ID = ? " +
        "AND CAT_NM = ?";

        int result = 0;

        try(
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ){

            DBConn.logSql(sql,userId,catNm);

            pstmt.setString(1,userId);
            pstmt.setString(2,catNm);

            result = pstmt.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

        return result;
    }
}