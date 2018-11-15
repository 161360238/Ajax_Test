package cn.wj.serviceImpl;

import cn.wj.bean.User;
import cn.wj.dao.UserDao;
import cn.wj.daoImpl.UserDaoImpl;
import cn.wj.service.UserService;

public class UserServiceImpl implements UserService{

	private UserDao userDao=new UserDaoImpl();
	public User selectUserService(String uname) {
		User user=userDao.selectUserDao(uname);
		return user;
	}

}
