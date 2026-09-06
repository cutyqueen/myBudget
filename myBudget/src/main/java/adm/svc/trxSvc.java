package adm.svc;

import java.util.List;
import java.util.UUID;

import adm.dao.trxDao;
import adm.dto.trxDto;

public class trxSvc {

    private trxDao trxDao;

    public trxSvc() {
        trxDao = new trxDao();
    }

    public List<trxDto> selectTransactionList(String userId) {
        return trxDao.selectTransactionList(userId);
    }

    public int insertTransaction(trxDto transaction) {
        transaction.setTranId(
                UUID.randomUUID()
                     .toString()
                     .replace("-", "")
        );

        return trxDao.insertTransaction(transaction);
    }
}