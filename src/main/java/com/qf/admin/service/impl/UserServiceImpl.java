package com.qf.admin.service.impl;

import com.qf.admin.dao.UserDao;
import com.qf.admin.pojo.po.User;
import com.qf.admin.service.UserService;
import com.qf.admin.util.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: DHC
 * Date: 2018/11/29
 * Time: 9:30
 * Version:V1.0
 */
@Service
public class UserServiceImpl implements UserService {
    //日志类的定义
    private final static Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
    //注入属性
    @Autowired
    private UserDao userDao;

    @Override
    public List<User> findUsers(int pageSize,int offset) {
        List<User> users = null;
        try {
            users = userDao.findUsers(pageSize,offset);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public List<User> findUsersByPage(PageInfo pageInfo) {
        List<User> users = null;
        try {
            users = userDao.findUsersByPage(pageInfo);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public int addUser(User user) {
        int i = 0;
        try {
            i = userDao.addUser(user);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int deleteuser(User user) {
        int i = 0;
        try {
            i = userDao.deleteuser(user);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public User toUpdate(User user) {
        try {
            user = userDao.toUpdate(user);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public int Update(User user) {
        int i = 0;
        try {
            i = userDao.Update(user);
        } catch (Exception e) {
            logger.info(e.getMessage(), e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int TotalCount() {
        System.out.println(userDao.CountUsers()+"hahaha");
        return userDao.CountUsers();
    }

    @Override
    public List<User> Search(PageInfo pageInfo) {
        return userDao.SearchUsers(pageInfo);

    }

    @Override
    public User checkUser(User user) {

        return userDao.checkUser(user);
    }

    @Override
    public User newCheck(String username, String password) {
        return userDao.newCheck(username,password);
    }

    @Override
    public int newTotalCount(String likeName) {

        return userDao.newTotalCount(likeName);
    }
}


