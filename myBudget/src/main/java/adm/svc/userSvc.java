package adm.svc;

import adm.dao.userDao;
import adm.dto.userDto;

public class userSvc {

    private userDao userDao;

    public userSvc() {
        userDao = new userDao();
    }

    public boolean authenticate(String userId, String userPassword) {
        return userDao.authenticate(userId, userPassword);
    }
    
    public int insertUser(userDto user) {
        return userDao.insertUser(user);
    }
}