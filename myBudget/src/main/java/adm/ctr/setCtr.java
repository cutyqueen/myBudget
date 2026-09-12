package adm.ctr;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adm.dto.noticeDto;
import adm.dto.userDto;
import adm.svc.noticeSvc;
import adm.svc.setSvc;
import java.util.List;

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
        
        //회계기간 콤보박스 조회
        setSvc setSvc = new setSvc();
        userDto user = setSvc.getAccountingPeriod(userId);

        if (user != null) {
            request.setAttribute("setYear", user.getSetYear());
            request.setAttribute("setMonth", user.getSetMonth());
        }
        

        // 페이지별 공지사항 조회
        List<noticeDto> noticeList = setSvc.getNoticeByMenu("SET");

        request.setAttribute("settingNoticeList", noticeList);
        
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
        
        //회계기간 콤보박스
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