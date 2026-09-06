package adm.ctr;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.dto.cocdDto;
import adm.dto.accDto;
import adm.dto.trxDto;
import adm.svc.cocdSvc;
import adm.svc.accSvc;
import adm.svc.trxSvc;

@WebServlet(urlPatterns = {
        "/trx/income",
        "/trx/expense",
        "/trx/transfer"
})
public class trxAddCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        String uri = request.getRequestURI();
        String viewPage;

        if (uri.endsWith("/income")) {
            viewPage = "/WEB-INF/views/trx/income.jsp";
        } else if (uri.endsWith("/expense")) {
            viewPage = "/WEB-INF/views/trx/expense.jsp";
        } else {
            viewPage = "/WEB-INF/views/trx/transfer.jsp";
        }

        cocdSvc cocdSvc = new cocdSvc();
        accSvc accSvc = new accSvc();

        List<cocdDto> incomeCatList =
                cocdSvc.selectCodeListByUpCd(
                        "INCOME_CAT"
                );

        request.setAttribute(
                "incomeCatList",
                incomeCatList
        );

        List<accDto> accountList =
                accSvc.selectAccountList();

        request.setAttribute(
                "incomeCatList",
                incomeCatList
        );
        
        request.setAttribute(
                "accountList",
                accountList
        );

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(viewPage);

        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        request.setCharacterEncoding("UTF-8");

        String transactionType =
                request.getParameter("transactionType");

        String transactionDate =
                request.getParameter("transactionDate");

        String inAccount =
                request.getParameter("inAccount");

        String outAccount =
                request.getParameter("outAccount");

        String majorCategory =
                request.getParameter("majorCategory");

        String minorCategory =
                request.getParameter("minorCategory");

        String amountStr =
                request.getParameter("amount");

        String content =
                request.getParameter("content");

        String memo =
                request.getParameter("memo");

        trxDto transaction = new trxDto();

        // 테스트용 사용자 ID
        transaction.setUserId("testuser");

        // 수입일 (YYYY-MM-DD → YYYYMMDD)
        transaction.setTranDt(transactionDate.replace("-", ""));

        // 거래유형: 01=수입, 02=지출, 03=이체
        if ("INCOME".equals(transactionType)) {
            transaction.setTypeCd("01");
            transaction.setInAcctId(inAccount);
            transaction.setOutAcctId(null);
        } else if ("EXPENSE".equals(transactionType)) {
            transaction.setTypeCd("02");
            transaction.setInAcctId(null);
            transaction.setOutAcctId(outAccount);
        } else {
            transaction.setTypeCd("03");
            transaction.setInAcctId(inAccount);
            transaction.setOutAcctId(outAccount);
        }

        // 카테고리 (소분류 코드)
        transaction.setCatCd(minorCategory);

        // 내용
        transaction.setContent(content);

        // 금액
        transaction.setAmount(Integer.parseInt(amountStr));

        // 메모 → REMRK
        transaction.setRemrk(memo);

        // 고정여부: 1=고정, 2=일반
        transaction.setFixedYn("2");

        // 결제수단: 기본값 01 (현금)
        transaction.setPaymentCd("01");

        trxSvc trxSvc = new trxSvc();
        trxSvc.insertTransaction(transaction);

        response.sendRedirect(
                request.getContextPath() + "/trx/list"
        );
    }
}