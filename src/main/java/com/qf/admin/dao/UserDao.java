package com.qf.admin.dao;

import com.qf.admin.pojo.po.User;
import com.qf.admin.util.PageInfo;

import java.util.List;

//Dao接口的文件名要和映射文件名相同
public interface UserDao {
    List<User> findUsers(int pageSize,int offset);

    int addUser(User user);

    int deleteuser(User user);

    User toUpdate(User user);

    int Update(User user);

    List<User> findUsersByPage(PageInfo pageInfo);

    int CountUsers();

    List<User> SearchUsers(PageInfo pageInfo);

    User checkUser(User user);

    User newCheck(String username, String password);

    int newTotalCount(String likeName);
}
