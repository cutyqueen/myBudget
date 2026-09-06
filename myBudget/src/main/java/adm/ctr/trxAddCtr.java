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

        List<cocdDto> expenseCatList =
                cocdSvc.selectCodeListByUpCd(
                        "EXPENSE_CAT"
                );

        List<accDto> accountList =
                accSvc.selectAccountList();

        request.setAttribute(
                "incomeCatList",
                incomeCatList
        );

        request.setAttribute(
                "expenseCatList",
                expenseCatList
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

        transaction.setUserId("testuser");
        transaction.setTranDt(transactionDate.replace("-", ""));

        if ("INCOME".equals(transactionType)) {
            transaction.setTypeCd("01");
            transaction.setInAcctId(inAccount);
        } else if ("EXPENSE".equals(transactionType)) {
            transaction.setTypeCd("02");
            transaction.setInAcctId(inAccount);
        } else {
            transaction.setTypeCd("03");
            transaction.setInAcctId(inAccount);
        }

        transaction.setCatCd(minorCategory);
        transaction.setContent(content);
        transaction.setAmount(Integer.parseInt(amountStr));
        transaction.setRemrk(memo);
        transaction.setFixedYn("2");

        trxSvc trxSvc = new trxSvc();
        trxSvc.insertTransaction(transaction);

        response.sendRedirect(
                request.getContextPath() + "/trx/list"
        );
    }
}