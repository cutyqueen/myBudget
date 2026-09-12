package adm.svc;

import java.util.List;

import adm.dao.userDao;
import adm.dao.catDao;
import adm.dto.userDto;

public class userSvc {

    private userDao userDao;
    private catDao catDao;

    public userSvc() {
        userDao = new userDao();
        catDao = new catDao();
    }

    public List<userDto> selectAllUsers() {
        return userDao.selectAllUsers();
    }
    
    public boolean authenticate(String userId, String userPassword) {
        return userDao.authenticate(userId, userPassword);
    }
    
    /* 회원가입 */
    public int insertUser(userDto user) {

        if (user.getMbpno() != null) {
            user.setMbpno(user.getMbpno().replace("-", ""));
        }

        int result = userDao.insertUser(user);

        if (result > 0) {

            int catResult = catDao.insertCategory(user.getUserId());

            if (catResult <= 0) {
                return 0;
            }
        }

        return result;
    }
}