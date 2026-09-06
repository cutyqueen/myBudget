package adm.svc;

import java.util.List;

import adm.dao.accDao;
import adm.dto.accDto;

public class accSvc {

    private accDao accDao;

    public accSvc() {
        accDao = new accDao();
    }

    public List<accDto> selectAccountList() {
        return accDao.selectAccountList();
    }
}