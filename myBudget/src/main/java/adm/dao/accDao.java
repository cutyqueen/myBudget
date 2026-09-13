package adm.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import adm.com.DBConn;
import adm.dto.accDto;

public class accDao {

    public List<accDto> findAccountList(String userId){
    	System.out.println("accDao.findAccountList 실행");
        System.out.println("userId = " + userId);
        List<accDto> list = new ArrayList<>();
        String sql =
        		"/* accDao.findAccountList */\n" +
        		"SELECT ACCOUNT_ID,\n" +
        		"       USER_ID,\n" +
        		"       SORT_NO,\n" +
        		"       CAT_ID,\n" +
        		"       CAT_TYPE,\n" +
        		"       CAT_NM,\n" +
        		"       SUB_CAT_NM,\n" +
        		"       TITLE,\n" +
        		"       START_AMOUNT,\n" +
        		"       REMRK,\n" +
        		"       USE_YN,\n" +
        		"       CREATE_DT,\n" +
        		"       MODIFY_DT\n" +
        		"FROM ACCOUNT\n" +
        		"WHERE USER_ID=?\n" +
        		"ORDER BY SORT_NO";

        try(Connection conn = DBConn.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
        	DBConn.logSql(sql,userId);
            pstmt.setString(1,userId);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()){

                accDto dto = new accDto();

                dto.setAccountId(rs.getInt("ACCOUNT_ID"));
                dto.setUserId(rs.getString("USER_ID"));
                dto.setSortNo(rs.getInt("SORT_NO"));
                dto.setCatId(rs.getInt("CAT_ID"));
                dto.setCatType(rs.getString("CAT_TYPE"));
                dto.setCatNm(rs.getString("CAT_NM"));
                dto.setSubCatNm(rs.getString("SUB_CAT_NM"));
                dto.setTitle(rs.getString("TITLE"));
                dto.setStartAmount(rs.getLong("START_AMOUNT"));
                dto.setRemrk(rs.getString("REMRK"));
                dto.setUseYn(rs.getString("USE_YN"));
                dto.setCreateDt(rs.getString("CREATE_DT"));
                dto.setModifyDt(rs.getString("MODIFY_DT"));

                list.add(dto);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
//자산/부채 저장
public int updateAccount(String userId, String[] accountIdList, String[] catTypeList, String[] catNmList, String[] subCatNmList, String[] titleList, String[] amountList, String[] remrkList, String[] useYnList) {

    int result = 0;

    String sql =
    	    "/* accDao.updateAccount */\n" +
    	    "UPDATE ACCOUNT\n" +
    	    "SET CAT_TYPE=?,\n" +
    	    "CAT_NM=?,\n" +
    	    "SUB_CAT_NM=?,\n" +
    	    "TITLE=?,\n" +
    	    "START_AMOUNT=?,\n" +
    	    "REMRK=?,\n" +
    	    "USE_YN=?,\n" +
    	    "MODIFY_DT=SYSDATE\n" +
    	    "WHERE ACCOUNT_ID=?\n" +
    	    "AND USER_ID=?";

    try(Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)){

        for(int i=0; i<accountIdList.length; i++){

        	pstmt.setString(1,catTypeList[i]);
        	pstmt.setString(2,catNmList[i]);
        	pstmt.setString(3,subCatNmList[i]);
        	pstmt.setString(4,titleList[i]);
        	pstmt.setLong(5,Long.parseLong(amountList[i]));
        	pstmt.setString(6,remrkList[i]);
        	pstmt.setString(7,useYnList[i]);
        	pstmt.setInt(8,Integer.parseInt(accountIdList[i]));
        	pstmt.setString(9,userId);

            result += pstmt.executeUpdate();
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return result;
}
}