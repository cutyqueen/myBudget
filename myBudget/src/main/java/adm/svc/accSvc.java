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
  //자산/부채 추가
    public int insertAccount(
        String userId,
        String catType,
        String catId,
        String catNm,
        String subCatNm,
        String title,
        String startAmount,
        String remrk,
        String useYn
    ){

        accDto dto = new accDto();

        dto.setAccountId(accDao.getNextAccountId());
        dto.setSortNo(accDao.getNextSortNo(userId, catType));

        dto.setUserId(userId);
        dto.setCatType(catType);
        dto.setCatId(catId == null || catId.equals("") ? 0 : Integer.parseInt(catId));
        dto.setCatNm(catNm);
        dto.setSubCatNm(subCatNm);
        dto.setTitle(title);
        dto.setStartAmount(Long.parseLong(startAmount));
        dto.setRemrk(remrk);
        dto.setUseYn(useYn);

        return accDao.insertAccount(dto);

    }
    //자산 삭제
    public int deleteAccount(String userId,String[] accountIdList){

        return accDao.deleteAccount(userId, accountIdList);

    }
}