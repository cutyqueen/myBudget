package adm.ctr;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adm.dto.userDto;
import adm.svc.setSvc;

@WebServlet(urlPatterns = {
        "/set"
})
public class setCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loginUser");

        setSvc setSvc = new setSvc();
        userDto user = setSvc.getAccountingPeriod(userId);

        if (user != null) {
            request.setAttribute("setYear", user.getSetYear());
            request.setAttribute("setMonth", user.getSetMonth());
        }

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/setting/set.jsp"
                );

        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loginUser");

        String acctYear = request.getParameter("acctYear");
        String acctMonth = request.getParameter("acctMonth");

        setSvc setSvc = new setSvc();
        int result = setSvc.updateAccountingPeriod(userId, acctYear, acctMonth);

        if (result > 0) {
            request.setAttribute("message", "저장되었습니다.");
        } else {
            request.setAttribute("message", "저장 실패");
        }

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/setting/set.jsp"
                );

        dispatcher.forward(request, response);
    }
}