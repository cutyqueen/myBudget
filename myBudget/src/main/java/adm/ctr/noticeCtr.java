package adm.ctr;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import adm.dto.noticeDto;
import adm.svc.noticeSvc;

@WebServlet("/notice/*")
public class noticeCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private noticeSvc noticeSvc = new noticeSvc();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getPathInfo();

        if ("/write".equals(action)) {
            // 작성 폼
            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/WEB-INF/views/notice/write.jsp");
            dispatcher.forward(request, response);

        } else if ("/list".equals(action)) {
            // 목록
            String noticeMenu = request.getParameter("noticeMenu");
            if (noticeMenu == null || noticeMenu.equals("")) {
                noticeMenu = "set";
            }
            List<noticeDto> noticeList = noticeSvc.selectNoticeList(noticeMenu);
            request.setAttribute("noticeList", noticeList);
            request.setAttribute("noticeMenu", noticeMenu);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/WEB-INF/views/notice/list.jsp");
            dispatcher.forward(request, response);

        } else if ("/edit".equals(action)) {
            // 수정 폼
            String noticeId = request.getParameter("noticeId");
            noticeDto notice = noticeSvc.selectNotice(noticeId);
            request.setAttribute("notice", notice);

            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/WEB-INF/views/notice/edit.jsp");
            dispatcher.forward(request, response);

        } else if ("/delete".equals(action)) {
            // 삭제
            String noticeId = request.getParameter("noticeId");
            String noticeMenu = request.getParameter("noticeMenu");
            noticeSvc.deleteNotice(noticeId);

            response.sendRedirect(request.getContextPath() + "/notice/list?noticeMenu=" + noticeMenu);
        }
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        String action = request.getPathInfo();

        if ("/write".equals(action)) {
            // 등록 처리
            noticeDto notice = new noticeDto();
            notice.setNoticeMenu(request.getParameter("noticeMenu"));
            notice.setTitle(request.getParameter("title"));
            notice.setContent(request.getParameter("content"));
            notice.setSort(request.getParameter("sort"));
            notice.setUseYn(request.getParameter("useYn"));

            noticeSvc.insertNotice(notice);

            response.sendRedirect(request.getContextPath() + "/notice/list?noticeMenu=" + notice.getNoticeMenu());

        } else if ("/edit".equals(action)) {
            // 수정 처리
            noticeDto notice = new noticeDto();
            notice.setNoticeId(request.getParameter("noticeId"));
            notice.setNoticeMenu(request.getParameter("noticeMenu"));
            notice.setTitle(request.getParameter("title"));
            notice.setContent(request.getParameter("content"));
            notice.setSort(request.getParameter("sort"));
            notice.setUseYn(request.getParameter("useYn"));

            noticeSvc.updateNotice(notice);

            response.sendRedirect(request.getContextPath() + "/notice/list?noticeMenu=" + notice.getNoticeMenu());
        }
    }
}