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
        
        // 회계기간 조회
        setSvc setSvc = new setSvc();
        userDto user = setSvc.getAccDate(userId);
        String setYear;
        String setMonth;

        if (user != null 
                && user.getSetYear() != null 
                && user.getSetMonth() != null) {

            // 저장된 값 사용
            setYear = user.getSetYear();
            setMonth = user.getSetMonth();

        } else {

            // 저장값 없으면 현재 날짜 사용
            java.time.LocalDate now = java.time.LocalDate.now();

            setYear = String.valueOf(now.getYear());
            setMonth = String.format("%02d", now.getMonthValue());
        }


        request.setAttribute("setYear", setYear);
        request.setAttribute("setMonth", setMonth);

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
        
        //회계기간 저장
        String setYear  = request.getParameter("acctYear");
        String setMonth = request.getParameter("acctMonth");

        setSvc setSvc = new setSvc();

        try {
        	System.out.println("1. updateAccDate 호출 전");
            System.out.println("userId = " + userId);
            System.out.println("setYear = " + setYear);
            System.out.println("setMonth = " + setMonth);
            int result = setSvc.updateAccDate(userId, setYear, setMonth);
            System.out.println("2. updateAccDate 결과 = " + result);

            if (result > 0) {
                session.setAttribute("msg", "회계 기준일이 저장되었습니다.");
            } else {
                session.setAttribute("msg", "저장에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", "오류가 발생했습니다: " + e.getMessage());
        }
        
        System.out.println("3. set.jsp 이동");
        response.sendRedirect(
                request.getContextPath() + "/set"
        );
    }
}