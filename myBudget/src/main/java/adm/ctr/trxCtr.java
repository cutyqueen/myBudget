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
        "/trx/list"
})
public class trxCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");

        trxDto searchDTO = new trxDto();
        searchDTO.setUserId("testuser");

        if (startDate != null && !startDate.isEmpty()) {
            searchDTO.setTranDt(startDate.replace("-", ""));
        }

        if (type != null && !type.isEmpty()) {
            if ("INCOME".equals(type)) {
                searchDTO.setTypeCd("01");
            } else if ("EXPENSE".equals(type)) {
                searchDTO.setTypeCd("02");
            } else if ("TRANSFER".equals(type)) {
                searchDTO.setTypeCd("03");
            }
        }

        if (keyword != null && !keyword.isEmpty()) {
            searchDTO.setContent(keyword);
        }

        trxSvc trxSvc = new trxSvc();
        List<trxDto> transactionList =
                trxSvc.selectTransactionList(searchDTO);

        request.setAttribute(
                "transactionList",
                transactionList
        );

        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
        request.setAttribute("type", type);
        request.setAttribute("keyword", keyword);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/trx/list.jsp"
                );

        dispatcher.forward(request, response);
    }
}