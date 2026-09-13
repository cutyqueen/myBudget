package adm.svc;

import java.util.List;

import adm.dao.accDao;
import adm.dto.accDto;

public class accSvc {

    private accDao accDao = new accDao();

    //자산 조회
    public List<accDto> findAccountList(String userId){
        System.out.println("accSvc.findAccountList 실행");
        return accDao.findAccountList(userId);
    }
    
  //자산/부채 저장
    public int updateAccount(
        String userId,
        String[] accountIdList,
        String[] catTypeList,
        String[] catNmList,
        String[] subCatNmList,
        String[] titleList,
        String[] amountList,
        String[] remrkList,
        String[] useYnList
    ){
        return accDao.updateAccount(
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
}