package adm.ctr;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import adm.svc.accSvc;

public class accCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("loginUser");

        accSvc accSvc = new accSvc();

        try {
            request.setAttribute("accountList", accSvc.findAccountList(userId));
        } catch(Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/set.jsp");
        rd.forward(request, response);
    }

}