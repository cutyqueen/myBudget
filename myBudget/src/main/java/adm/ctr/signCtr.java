package adm.ctr;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.dto.userDto;
import adm.svc.userSvc;

@WebServlet(urlPatterns = {
        "/user/sign"
})
public class signCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/user/sign.jsp"
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
        String userNm = request.getParameter("userNm");
        String pw = request.getParameter("pw");
        String email = request.getParameter("email");
        String mbpno = request.getParameter("mbpno");

        userDto user = new userDto();

        user.setUserId(userId);
        user.setUserNm(userNm);
        user.setPw(pw);
        user.setEmail(email);
        user.setMbpno(mbpno);

        userSvc userSvc = new userSvc();
        int result = userSvc.insertUser(user);

        if (result > 0) {
            request.setAttribute("success", "true");

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher(
                            "/WEB-INF/views/user/sign.jsp"
                    );

            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("error", "회원가입에 실패했습니다.");

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher(
                            "/WEB-INF/views/user/sign.jsp"
                    );

            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        }
    }
}