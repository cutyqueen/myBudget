package adm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import adm.com.DBConn;
import adm.dto.cocdDto;

public class cocdDao {

    public List<cocdDto> selectCodeList(
            String upCd,
            String lowCd
    ) {
        List<cocdDto> codeList =
                new ArrayList<cocdDto>();

        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT ");
        sql.append("     UP_CD, ");
        sql.append("     UP_NM, ");
        sql.append("     LOW_CD, ");
        sql.append("     LOW_NM, ");
        sql.append("     VAL_CD, ");
        sql.append("     VAL_NM, ");
        sql.append("     SORT, ");
        sql.append("     USE_YN, ");
        sql.append("     GRP_YN, ");
        sql.append("     ITEM1, ");
        sql.append("     ITEM2, ");
        sql.append("     ITEM3, ");
        sql.append("     REMRK ");
        sql.append(" FROM COCD ");
        sql.append(" WHERE UP_CD = ? ");
        sql.append("   AND LOW_CD = ? ");
        sql.append("   AND USE_YN = '1' ");
        sql.append(" ORDER BY SORT,VAL_CD ");

        try (
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt =
                    conn.prepareStatement(sql.toString())
        ) {
            pstmt.setString(1, upCd);
            pstmt.setString(2, lowCd);

            try (
                ResultSet rs = pstmt.executeQuery()
            ) {
                while (rs.next()) {
                    cocdDto code = new cocdDto();

                    code.setUpCd(rs.getString("UP_CD"));
                    code.setUpNm(rs.getString("UP_NM"));
                    code.setLowCd(rs.getString("LOW_CD"));
                    code.setLowNm(rs.getString("LOW_NM"));
                    code.setValCd(rs.getString("VAL_CD"));
                    code.setValNm(rs.getString("VAL_NM"));
                    code.setSort(rs.getInt("SORT"));
                    code.setUseYn(rs.getString("USE_YN"));
                    code.setGrpYn(rs.getString("GRP_YN"));
                    code.setItem1(rs.getString("ITEM1"));
                    code.setItem2(rs.getString("ITEM2"));
                    code.setItem3(rs.getString("ITEM3"));
                    code.setRemrk(rs.getString("REMRK"));

                    codeList.add(code);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return codeList;
    }
    
    public List<cocdDto> selectCodeListByUpCd(String upCd) {
        List<cocdDto> codeList =
                new ArrayList<cocdDto>();

        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT ");
        sql.append("     UP_CD, ");
        sql.append("     UP_NM, ");
        sql.append("     LOW_CD, ");
        sql.append("     LOW_NM, ");
        sql.append("     VAL_CD, ");
        sql.append("     VAL_NM, ");
        sql.append("     SORT, ");
        sql.append("     USE_YN, ");
        sql.append("     GRP_YN, ");
        sql.append("     ITEM1, ");
        sql.append("     ITEM2, ");
        sql.append("     ITEM3, ");
        sql.append("     REMRK ");
        sql.append(" FROM COCD ");
        sql.append(" WHERE UP_CD = ? ");
        sql.append("   AND USE_YN = '1' ");
        sql.append(" ORDER BY LOW_CD, SORT, VAL_CD ");

        try (
            Connection conn = DBConn.getConnection();
            PreparedStatement pstmt =
                    conn.prepareStatement(sql.toString())
        ) {
            pstmt.setString(1, upCd);

            try (
                ResultSet rs = pstmt.executeQuery()
            ) {
                while (rs.next()) {
                    cocdDto code = new cocdDto();

                    code.setUpCd(rs.getString("UP_CD"));
                    code.setUpNm(rs.getString("UP_NM"));
                    code.setLowCd(rs.getString("LOW_CD"));
                    code.setLowNm(rs.getString("LOW_NM"));
                    code.setValCd(rs.getString("VAL_CD"));
                    code.setValNm(rs.getString("VAL_NM"));
                    code.setSort(rs.getInt("SORT"));
                    code.setUseYn(rs.getString("USE_YN"));
                    code.setGrpYn(rs.getString("GRP_YN"));
                    code.setItem1(rs.getString("ITEM1"));
                    code.setItem2(rs.getString("ITEM2"));
                    code.setItem3(rs.getString("ITEM3"));
                    code.setRemrk(rs.getString("REMRK"));

                    codeList.add(code);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return codeList;
    }
}