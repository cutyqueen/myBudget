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
//자산/부채 추가
public int insertAccount(accDto dto){

    int result = 0;


    String sql =
    	    "/* accDao.insertAccount */\n" +
    	    "INSERT INTO ACCOUNT(\n" +
    	    "ACCOUNT_ID,\n" +
    	    "USER_ID,\n" +
    	    "SORT_NO,\n" +
    	    "CAT_ID,\n    " +
    	    "CAT_TYPE,\n" +
    	    "CAT_NM,\n" +
    	    "SUB_CAT_NM,\n" +
    	    "TITLE,\n" +
    	    "START_AMOUNT,\n" +
    	    "REMRK,\n" +
    	    "USE_YN,\n" +
    	    "CREATE_DT\n" +
    	    ")\n" +
    	    "VALUES(\n" +
    	    "?,?,?,?,?,?,?,?,?,?,?,SYSDATE\n" +
    	    ")";


    try(Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)){


    	pstmt.setInt(1,dto.getAccountId());
    	pstmt.setString(2,dto.getUserId());
    	pstmt.setInt(3,dto.getSortNo());
    	pstmt.setInt(4,dto.getCatId());
    	pstmt.setString(5,dto.getCatType());
    	pstmt.setString(6,dto.getCatNm());
    	pstmt.setString(7,dto.getSubCatNm());
    	pstmt.setString(8,dto.getTitle());
    	pstmt.setLong(9,dto.getStartAmount());
    	pstmt.setString(10,dto.getRemrk());
    	pstmt.setString(11,dto.getUseYn());


        result = pstmt.executeUpdate();


    }catch(Exception e){
        e.printStackTrace();
    }

    return result;
}

//ACCOUNT_ID 자동 생성
public int getNextAccountId(){

  int accountId = 1;

  String sql =
      "/* accDao.deleteAccount */\n" +  
      "SELECT NVL(MAX(ACCOUNT_ID),0)+1 " +
      "FROM ACCOUNT";

  try(Connection conn = DBConn.getConnection();
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery()){
	  DBConn.logSql(sql);
      if(rs.next()){
          accountId = rs.getInt(1);
      }

  }catch(Exception e){
      e.printStackTrace();
  }

  return accountId;
}

//자산/부채 정렬번호 자동 생성
public int getNextSortNo(String userId, String catType){

  int sortNo = "ASSET".equals(catType) ? 1000 : 2000;

  String sql =
	  "/* accDao.deleteAccount */\n" +  
      "SELECT NVL(MAX(SORT_NO),?) + 1 " +
      "FROM ACCOUNT " +
      "WHERE USER_ID=? " +
      "AND CAT_TYPE=?";

  try(Connection conn = DBConn.getConnection();
      PreparedStatement pstmt = conn.prepareStatement(sql)){
	  DBConn.logSql(sql);
      pstmt.setInt(1, sortNo - 1);
      pstmt.setString(2, userId);
      pstmt.setString(3, catType);

      ResultSet rs = pstmt.executeQuery();

      if(rs.next()){
          sortNo = rs.getInt(1);
      }

  }catch(Exception e){
      e.printStackTrace();
  }

  return sortNo;
}
//자산 삭제
//자산 삭제
public int deleteAccount(String userId,String[] accountIdList){

  int result=0;

  String sql =
  "/* accDao.deleteAccount */\n" +
  "DELETE FROM ACCOUNT\n" +
  "WHERE ACCOUNT_ID=?\n" +
  "AND USER_ID=?";

  DBConn.logSql(sql);
  try(Connection conn=DBConn.getConnection();
      PreparedStatement pstmt=conn.prepareStatement(sql)){

      for(String id : accountIdList){

          pstmt.setInt(1,Integer.parseInt(id));
          pstmt.setString(2,userId);

          DBConn.logSql(
              sql.replaceFirst("\\?", id)
                 .replaceFirst("\\?", "'" + userId + "'")
          );

          result += pstmt.executeUpdate();
      }

  }catch(Exception e){
      e.printStackTrace();
  }

  return result;
}
}