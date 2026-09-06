package adm.svc;

import java.util.List;

import adm.dao.cocdDao;
import adm.dto.cocdDto;

public class cocdSvc {

    private cocdDao cocdDao;

    public cocdSvc() {
        cocdDao = new cocdDao();
    }

    public List<cocdDto> selectCodeList(
            String upCd,
            String lowCd
    ) {
        return cocdDao.selectCodeList(
                upCd,
                lowCd
        );
    }
    
    public List<cocdDto> selectCodeListByUpCd(String upCd) {
        return cocdDao.selectCodeListByUpCd(upCd);
    }
}