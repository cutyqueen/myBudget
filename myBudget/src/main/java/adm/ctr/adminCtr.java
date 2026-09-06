package adm.ctr;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import adm.dto.userDto;
import adm.dto.noticeDto;
import adm.svc.userSvc;
import adm.svc.noticeSvc;

@WebServlet("/user/admin")
public class adminCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        // 사용자 목록 조회
        userSvc userSvc = new userSvc();
        List<userDto> userList = userSvc.selectAllUsers();
        request.setAttribute("userList", userList);

        // 공지사항 목록 조회 (가계부 설정 기본)
        String noticeMenu = request.getParameter("noticeMenu");
        if (noticeMenu == null || noticeMenu.equals("")) {
            noticeMenu = "set";
        }
        noticeSvc noticeSvc = new noticeSvc();
        List<noticeDto> noticeList = noticeSvc.selectNoticeList(noticeMenu);
        request.setAttribute("noticeList", noticeList);
        request.setAttribute("noticeMenu", noticeMenu);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/user/admin.jsp"
                );

        dispatcher.forward(request, response);
    }
}