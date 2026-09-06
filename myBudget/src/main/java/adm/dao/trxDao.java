package adm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import adm.com.DBConn;
import adm.dto.trxDto;

public class trxDao {

    public List<trxDto> selectTransactionList(trxDto searchDTO) {
        List<trxDto> transactionList =
                new ArrayList<trxDto>();

        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT A.TRAN_ID, ");
        sql.append("        A.USER_ID, ");
        sql.append("        A.TRAN_DT, ");
        sql.append("        A.TYPE_CD, ");
        sql.append("        A.CAT_CD, ");
        sql.append("        A.CONTENT, ");
        sql.append("        A.AMOUNT, ");
        sql.append("        A.ACCT_ID, ");
        sql.append("        A.ACCT_NM, ");
        sql.append("        A.FIXED_YN, ");
        sql.append("        A.REMRK, ");
        sql.append("        C.LOW_NM AS catMajorNm, ");
        sql.append("        C.VAL_NM AS catMinorNm ");
        sql.append("   FROM TRANSACTIONS A, ");
        sql.append("        COCD C ");
        sql.append("  WHERE A.CAT_CD = C.VAL_CD(+) ");
        sql.append("    AND C.UP_CD(+) = 'EXPENSE_CAT' ");
        sql.append("    AND C.USE_YN(+) = '1' ");
        sql.append("    AND A.USER_ID = ? ");

        if (searchDTO.getTranDt() != null && !searchDTO.getTranDt().isEmpty()) {
            sql.append("    AND A.TRAN_DT >= TO_DATE(?, 'YYYYMMDD') ");
        }

        if (searchDTO.getTypeCd() != null && !searchDTO.getTypeCd().isEmpty()) {
            sql.append("    AND A.TYPE_CD = ? ");
        }

        if (searchDTO.getContent() != null && !searchDTO.getContent().isEmpty()) {
            sql.append("    AND A.CONTENT LIKE ? ");
        }

        sql.append("  ORDER BY A.TRAN_DT DESC, A.CREAT_DT DESC ");

        try (
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt =
                    conn.prepareStatement(sql.toString())
        ) {
            int paramIndex = 1;

            pstmt.setString(paramIndex++, searchDTO.getUserId());

            if (searchDTO.getTranDt() != null && !searchDTO.getTranDt().isEmpty()) {
                pstmt.setString(paramIndex++, searchDTO.getTranDt());
            }

            if (searchDTO.getTypeCd() != null && !searchDTO.getTypeCd().isEmpty()) {
                pstmt.setString(paramIndex++, searchDTO.getTypeCd());
            }

            if (searchDTO.getContent() != null && !searchDTO.getContent().isEmpty()) {
                pstmt.setString(paramIndex++, "%" + searchDTO.getContent() + "%");
            }

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
                    transaction.setInAcctId(rs.getString("ACCT_ID"));
                    transaction.setOutAcctId(null);
                    transaction.setFixedYn(rs.getString("FIXED_YN"));
                    transaction.setRemrk(rs.getString("REMRK"));

                    transaction.setCatMajorNm(rs.getString("catMajorNm"));
                    transaction.setCatMinorNm(rs.getString("catMinorNm"));
                    transaction.setInAcctNm(rs.getString("ACCT_NM"));
                    transaction.setOutAcctNm(null);

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
        sql.append("     ACCT_ID, ");
        sql.append("     ACCT_NM, ");
        sql.append("     FIXED_YN, ");
        sql.append("     REMRK, ");
        sql.append("     CREAT_DT, ");
        sql.append("     MODIFY_DT ");
        sql.append(" ) VALUES ( ");
        sql.append("     ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ");
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
            pstmt.setString(9, transaction.getInAcctNm());
            pstmt.setString(10, transaction.getFixedYn());
            pstmt.setString(11, transaction.getRemrk());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}