package adm.ctr;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adm.svc.userSvc;

@WebServlet(urlPatterns = {
        "/user/login"
})
public class loginCtr extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        // 로그인 폼
        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/user/login.jsp"
                );

        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        request.setCharacterEncoding("UTF-8");

        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");
        
        System.out.println("로그인 시도: " + userId);

        userSvc userSvc = new userSvc();
        boolean isAuthenticated = userSvc.authenticate(userId, userPassword);
        
        System.out.println("인증 결과: " + isAuthenticated);

        if (isAuthenticated) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", userId);

            System.out.println("리다이렉트: /trx/list");

            response.sendRedirect(
                    request.getContextPath() + "/trx/list"
            );
        } else {
            request.setAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher(
                            "/WEB-INF/views/user/login.jsp"
                    );

            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        }
    }
}