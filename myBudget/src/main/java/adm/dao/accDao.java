package adm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import adm.com.DBConn;
import adm.dto.accDto;

public class accDao {

    public List<accDto> selectAccountList() {
        List<accDto> accountList =
                new ArrayList<accDto>();

        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT ");
        sql.append("     ACCT_ID, ");
        sql.append("     ACCT_NM, ");
        sql.append("     CAT_CD, ");
        sql.append("     BALANCE, ");
        sql.append("     USE_YN ");
        sql.append(" FROM ACCOUNTS ");
        sql.append(" WHERE USE_YN = '1' ");
        sql.append(" ORDER BY ACCT_NM ");

        try (
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt =
                    conn.prepareStatement(sql.toString())
        ) {
            try (
                ResultSet rs = pstmt.executeQuery()
            ) {
                while (rs.next()) {
                    accDto account = new accDto();

                    account.setAcctId(rs.getString("ACCT_ID"));
                    account.setAcctNm(rs.getString("ACCT_NM"));
                    account.setCatCd(rs.getString("CAT_CD"));
                    account.setBalance(rs.getInt("BALANCE"));
                    account.setUseYn(rs.getString("USE_YN"));

                    accountList.add(account);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return accountList;
    }
}