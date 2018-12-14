package com.qf.admin.service;

import com.qf.admin.pojo.po.User;
import com.qf.admin.util.PageInfo;

import java.util.List;

public interface UserService {
    List<User> findUsers(int pageSize,int offset);

    int addUser(User user);

    int deleteuser(User user);

    User toUpdate(User user);

    int Update(User user);

    List<User> findUsersByPage(PageInfo pageInfo);

    int TotalCount();

    List<User> Search(PageInfo pageInfo);

    User checkUser(User user);

    User newCheck(String username, String password);

    int newTotalCount(String likeName);
}
