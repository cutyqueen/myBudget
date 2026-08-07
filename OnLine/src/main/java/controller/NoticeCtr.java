package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.NoticeDto;
import service.NoticeSvc;

@WebServlet("/notice/list")
public class NoticeCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private NoticeSvc noticeSvc = new NoticeSvc();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<NoticeDto> noticeList =
                noticeSvc.getNoticeList();

        request.setAttribute("noticeList", noticeList);

        request.getRequestDispatcher(
                "/WEB-INF/views/notice/noticeList.jsp")
               .forward(request, response);
    }
}