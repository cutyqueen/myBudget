package adm.ctr;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/acc/add")
public class accAddCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/acc/add.jsp"
                );

        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        /*
         * 현재는 DB 연결 전입니다.
         * 다음 DB 단계에서 accountType, category, accountName,
         * initialBalance, memo 값을 받아 Oracle에 INSERT합니다.
         */

        response.sendRedirect(
                request.getContextPath() + "/acc/list"
        );
    }
}