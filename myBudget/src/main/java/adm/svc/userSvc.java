package adm.svc;

import java.util.List;

import adm.dao.userDao;
import adm.dto.userDto;

public class userSvc {

    private userDao userDao;

    public userSvc() {
        userDao = new userDao();
    }

    public List<userDto> selectAllUsers() {
        return userDao.selectAllUsers();
    }
    
    public boolean authenticate(String userId, String userPassword) {
        return userDao.authenticate(userId, userPassword);
    }
    
    public int insertUser(userDto user) {
        // 전화번호 하이픈 제거
        if (user.getMbpno() != null) {
            user.setMbpno(user.getMbpno().replace("-", ""));
        }
        return userDao.insertUser(user);
    }
    
}