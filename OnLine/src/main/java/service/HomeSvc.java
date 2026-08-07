package service;

import dao.HomeDao;
import dto.HomeDto;

public class HomeSvc {

    private HomeDao homeDao = new HomeDao();

    public HomeDto getHomeInfo() {
        return homeDao.selectHomeInfo();
    }
}