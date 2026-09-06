package adm.ctr;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.dto.cocdDto;
import adm.svc.cocdSvc;

@WebServlet("/test/cocd")
public class cocdTestCtr extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        cocdSvc cocdSvc = new cocdSvc();

        List<cocdDto> codeList =
                cocdSvc.selectCodeList(
                        "TRAN_TYPE",
                        "01"
                );

        request.setAttribute(
                "codeList",
                codeList
        );

        RequestDispatcher dispatcher =
                request.getRequestDispatcher(
                        "/WEB-INF/views/test/cocd.jsp"
                );

        dispatcher.forward(
                request,
                response
        );
    }
}