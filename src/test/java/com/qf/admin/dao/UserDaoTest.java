package com.qf.admin.dao;

import com.qf.admin.pojo.po.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao-test.xml"})
public class UserDaoTest {
    @Autowired
    private UserDao userdao;
    @Test
    public void testfindUsers() throws Exception {
        System.out.println(userdao.findUsers().size());
    }

}