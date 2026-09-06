package adm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import adm.com.DBConn;
import adm.dto.trxDto;
import adm.dto.cocdDto;
import adm.dto.accDto;

public class trxDao {

    public List<trxDto> selectTransactionList(String userId) {
        List<trxDto> transactionList =
                new ArrayList<trxDto>();

        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT ");
        sql.append("     TRAN_ID, ");
        sql.append("     USER_ID, ");
        sql.append("     TRAN_DT, ");
        sql.append("     TYPE_CD, ");
        sql.append("     CAT_CD, ");
        sql.append("     CONTENT, ");
        sql.append("     AMOUNT, ");
        sql.append("     IN_ACCT_ID, ");
        sql.append("     OUT_ACCT_ID, ");
        sql.append("     PAYMENT_CD, ");
        sql.append("     FIXED_YN, ");
        sql.append("     REMRK ");
        sql.append(" FROM TRANSACTIONS ");
        sql.append(" WHERE USER_ID = ? ");
        sql.append(" ORDER BY TRAN_DT DESC, CREAT_DT DESC ");

        try (
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt =
                    conn.prepareStatement(sql.toString())
        ) {
            pstmt.setString(1, userId);

            try (
                ResultSet rs = pstmt.executeQuery()
            ) {
                while (rs.next()) {
                    trxDto transaction = new trxDto();

                    transaction.setTranId(rs.getString("TRAN_ID"));
                    transaction.setUserId(rs.getString("USER_ID"));
                    transaction.setTranDt(rs.getString("TRAN_DT"));
                    transaction.setTypeCd(rs.getString("TYPE_CD"));
                    transaction.setCatCd(rs.getString("CAT_CD"));
                    transaction.setContent(rs.getString("CONTENT"));
                    transaction.setAmount(rs.getInt("AMOUNT"));
                    transaction.setInAcctId(rs.getString("IN_ACCT_ID"));
                    transaction.setOutAcctId(rs.getString("OUT_ACCT_ID"));
                    transaction.setPaymentCd(rs.getString("PAYMENT_CD"));
                    transaction.setFixedYn(rs.getString("FIXED_YN"));
                    transaction.setRemrk(rs.getString("REMRK"));

                    transactionList.add(transaction);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return transactionList;
    }

    public int insertTransaction(trxDto transaction) {
        StringBuilder sql = new StringBuilder();

        sql.append(" INSERT INTO TRANSACTIONS ( ");
        sql.append("     TRAN_ID, ");
        sql.append("     USER_ID, ");
        sql.append("     TRAN_DT, ");
        sql.append("     TYPE_CD, ");
        sql.append("     CAT_CD, ");
        sql.append("     CONTENT, ");
        sql.append("     AMOUNT, ");
        sql.append("     IN_ACCT_ID, ");
        sql.append("     OUT_ACCT_ID, ");
        sql.append("     PAYMENT_CD, ");
        sql.append("     FIXED_YN, ");
        sql.append("     REMRK, ");
        sql.append("     CREAT_DT, ");
        sql.append("     MODIFY_DT ");
        sql.append(" ) VALUES ( ");
        sql.append("     ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ");
        sql.append("     SYSDATE, SYSDATE ");
        sql.append(" ) ");

        try (
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt =
                    conn.prepareStatement(sql.toString())
        ) {
            pstmt.setString(1, transaction.getTranId());
            pstmt.setString(2, transaction.getUserId());
            pstmt.setString(3, transaction.getTranDt());
            pstmt.setString(4, transaction.getTypeCd());
            pstmt.setString(5, transaction.getCatCd());
            pstmt.setString(6, transaction.getContent());
            pstmt.setInt(7, transaction.getAmount());
            pstmt.setString(8, transaction.getInAcctId());
            pstmt.setString(9, transaction.getOutAcctId());
            pstmt.setString(10, transaction.getPaymentCd());
            pstmt.setString(11, transaction.getFixedYn());
            pstmt.setString(12, transaction.getRemrk());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}