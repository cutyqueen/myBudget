package adm.ctr;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/login")
public class loginCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("loginUser") != null) {
            response.sendRedirect(
                    request.getContextPath() + "/board/main"
            );
            return;
        }

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
    ) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String loginId = request.getParameter("loginId");
        String password = request.getParameter("password");

        if ("admin".equals(loginId) && "1234".equals(password)) {

            HttpSession session = request.getSession();

            /*
             * 현재는 DB 연결 전이므로 사용자 이름만 임시로 저장합니다.
             * 나중에는 UserDTO 객체를 loginUser에 저장합니다.
             */
            session.setAttribute("loginUser", "관리자");
            session.setMaxInactiveInterval(30 * 60);

            response.sendRedirect(
                    request.getContextPath() + "/board/main"
            );
            return;
        }

        request.setAttribute(
                "errorMessage",
                "아이디 또는 비밀번호가 올바르지 않습니다."
        );

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/user/login.jsp"
                );

        dispatcher.forward(request, response);
    }
}