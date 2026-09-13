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

import adm.dao.catDao;
import adm.dto.catDto;
import adm.dto.catGroupDto;
import adm.dto.noticeDto;
import adm.dto.userDto;
import adm.svc.accSvc;
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

        if (user != null && user.getSetYear() != null && user.getSetMonth() != null) {
            // DB값 조회
            setYear = user.getSetYear();
            setMonth = user.getSetMonth();

        } else {
            // DB값 없으면 현재 날짜 사용
            java.time.LocalDate now = java.time.LocalDate.now();
            setYear = String.valueOf(now.getYear());
            setMonth = String.format("%02d", now.getMonthValue());
        }
        request.setAttribute("setYear", setYear);
        request.setAttribute("setMonth", setMonth);

        // 페이지별 공지사항 조회
        List<noticeDto> noticeList = setSvc.getNoticeByMenu("SET");
        request.setAttribute("settingNoticeList", noticeList);
        
        //가계부설정-카테고리 조회
        catDao catDao = new catDao();

        List<catDto> categoryList = catDao.findCategory(userId);
        List<catGroupDto> categoryGroup = setSvc.groupCategory(categoryList);

        request.setAttribute("categoryList", categoryList);
        request.setAttribute("categoryGroup", categoryGroup);
        
        //가계부설정-자산/부채 조회
        accSvc accSvc = new accSvc();
        request.setAttribute("accountList", accSvc.findAccountList(userId));
        
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

        setSvc setSvc = new setSvc();

        String action = request.getParameter("action");

        try {

            //카테고리 대분류 추가
            if("insertCatNm".equals(action)){

                String catType = request.getParameter("catType");
                String catNm = request.getParameter("catNm");

                int result = setSvc.insertCatNm(userId, catType, catNm);

                if(result > 0){
                    session.setAttribute("msg", "카테고리가 추가되었습니다.");
                }else{
                    session.setAttribute("msg", "카테고리 추가에 실패했습니다.");
                }
             //카테고리 소분류 추가
            }else if("insertSubCat".equals(action)){

                String catType = request.getParameter("catType");
                String catNm = request.getParameter("catNm");
                String subCatNm = request.getParameter("subCatNm");
                String fixYn = request.getParameter("fixYn");

                int result = setSvc.insertSubCat(
                        userId,
                        catType,
                        catNm,
                        subCatNm,
                        fixYn
                );

                if(result > 0){
                    session.setAttribute("msg", "소분류가 추가되었습니다.");
                }else{
                    session.setAttribute("msg", "소분류 추가에 실패했습니다.");
                }
           //카테고리 소분류 저장
            } else if("updateCategory".equals(action)){

                String[] catIdList = request.getParameterValues("catIdList");
                String[] subCatNmList = request.getParameterValues("subCatNmList");
                String[] fixYnList = request.getParameterValues("fixYnList");

                int result = setSvc.updateCategory(
                        userId,
                        catIdList,
                        subCatNmList,
                        fixYnList
                );

                if(result > 0){
                    session.setAttribute("msg","카테고리가 저장되었습니다.");
                }else{
                    session.setAttribute("msg","저장 실패");
                }
            //카테고리 삭제
            } else if("deleteSubCat".equals(action)){

                String catId = request.getParameter("catId");

                int result = setSvc.deleteSubCat(userId, catId);

                if(result > 0){
                    session.setAttribute("msg","소분류가 삭제되었습니다.");
                }else{
                    session.setAttribute("msg","삭제 실패");
                }

            }else if("deleteCat".equals(action)){

                String catNm = request.getParameter("catNm");

                int result = setSvc.deleteCat(userId, catNm);

                if(result > 0){
                    session.setAttribute("msg","대분류가 삭제되었습니다.");
                }else{
                    session.setAttribute("msg","삭제 실패");
                }
           //자산/부채 저장
            }else if("updateAccount".equals(action)){
                String[] accountIdList = request.getParameterValues("accountIdList");
                String[] titleList = request.getParameterValues("titleList");
                String[] amountList = request.getParameterValues("amountList");
                String[] remrkList = request.getParameterValues("remrkList");
                String[] useYnList = request.getParameterValues("useYnList");
                String[] catTypeList = request.getParameterValues("catTypeList");
                String[] catNmList = request.getParameterValues("catNmList");
                String[] subCatNmList = request.getParameterValues("subCatNmList");
                String[] deleteAccountList = request.getParameterValues("deleteAccountList");
                accSvc accSvc = new accSvc();
                int result = 0;
                // 삭제 처리
                if(deleteAccountList != null && deleteAccountList.length > 0){
                    accSvc.deleteAccount(
                        userId,
                        deleteAccountList
                    );
                }
                // 수정 처리
                if(accountIdList != null && accountIdList.length > 0){
                    result = accSvc.updateAccount(
                        userId,
                        accountIdList,
                        catTypeList,
                        catNmList,
                        subCatNmList,
                        titleList,
                        amountList,
                        remrkList,
                        useYnList
                    );
                }
                if(result > 0){
                    session.setAttribute("msg", "자산 정보가 수정되었습니다.");
                }else if(deleteAccountList != null && deleteAccountList.length > 0){
                    session.setAttribute("msg", "자산 정보가 삭제되었습니다.");
                }else{
                    session.setAttribute("msg", "변경된 내용이 없습니다.");
                }
            //자산/부채 추가
            }else if("insertAccount".equals(action)){

                String catType = request.getParameter("catType");
                String catId = request.getParameter("catId");
                String catNm = request.getParameter("catNm");
                String subCatNm = request.getParameter("subCatNm");
                String title = request.getParameter("title");
                String startAmount = request.getParameter("startAmount");
                String remrk = request.getParameter("remrk");
                String useYn = request.getParameter("useYn");

                accSvc accSvc = new accSvc();

                int result = accSvc.insertAccount(
                    userId,
                    catType,
                    catId,
                    catNm,
                    subCatNm,
                    title,
                    startAmount,
                    remrk,
                    useYn
                );                            
           //회계기간 저장
            }else{
                String setYear  = request.getParameter("acctYear");
                String setMonth = request.getParameter("acctMonth");

                int result = setSvc.updateAccDate(userId, setYear, setMonth);

                if(result > 0){
                    session.setAttribute("msg", "회계 기준일이 저장되었습니다.");
                }else{
                    session.setAttribute("msg", "저장에 실패했습니다.");
                }
            }

        }catch(Exception e){
            e.printStackTrace();
            session.setAttribute("msg", "오류가 발생했습니다: " + e.getMessage());
        }

        response.sendRedirect(
                request.getContextPath() + "/set"
        );
    }
    
}