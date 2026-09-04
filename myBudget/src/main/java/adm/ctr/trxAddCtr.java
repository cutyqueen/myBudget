package adm.ctr;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

        /*
         * DB 연결 전이므로 실제 저장은 하지 않습니다.
         * 다음 단계에서 입력값을 받아 Oracle에 저장합니다.
         */

        response.sendRedirect(
                request.getContextPath() + "/trx/list"
        );
    }
}