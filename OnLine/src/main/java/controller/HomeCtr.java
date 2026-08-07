package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.HomeDto;
import service.HomeSvc;

@WebServlet("/home")
public class HomeCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private HomeSvc homeSvc = new HomeSvc();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HomeDto home = homeSvc.getHomeInfo();

        request.setAttribute("home", home);

        request.getRequestDispatcher(
                "/WEB-INF/views/home/home.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}