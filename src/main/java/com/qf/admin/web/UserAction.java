package com.qf.admin.web;

import com.qf.admin.pojo.po.User;
import com.qf.admin.service.UserService;
import com.qf.admin.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserAction {
    @Autowired
    //注入属性
    private UserService userService;

    @RequestMapping(value = "/findUsers", method = RequestMethod.GET)
    public String ShowUsers(Model model,
                            HttpServletRequest request,
                            @RequestParam(defaultValue = "1") int pageIndex) {
        PageInfo pageInfo = new PageInfo();
        pageInfo.setPageIndex(pageIndex);
        pageInfo.setPageSize(5);
        System.out.println(request.getParameter("page1"));
        String PageIndex = request.getParameter("page1");
        if (PageIndex != null) {
            pageInfo.setPageIndex(Integer.parseInt(PageIndex));
        }
        System.out.println(userService.TotalCount() + "gagaga");
        pageInfo.setTotalCount(userService.TotalCount());
        model.addAttribute("pageInfo", pageInfo);
        List<User> users = userService.findUsersByPage(pageInfo);
        model.addAttribute("Users", users);

        //默认转发
        return "index";
    }

    @GetMapping("/toaddUser")
    public String toaddUsers() {
        return "addUser";
    }

    @ResponseBody
    @PostMapping("/addUser")
    public Map addUsers(User user) {
        Map<String, Object> map = new HashMap<>();
        int i = userService.addUser(user);
        if (i != 0) {
            map.put("message", "success");
            return map;
        } else {
            map.put("message", "fail");
            return map;
        }
    }

    @GetMapping("/deleteuser")
    public String deleteUsers(User user) {
        userService.deleteuser(user);
        return "redirect:findUsers";
    }

    @GetMapping("/toUpdate")
    public String showUpdate(User user, Model model) {
        user = userService.toUpdate(user);
        model.addAttribute("user", user);
        return "UpdataUser";
    }

    @PostMapping("/Update")
    public String Update(User user) {
        userService.Update(user);
        return "redirect:findUsers";
    }

    @GetMapping("/Search")
    public String Search(HttpServletRequest request,
                         Model model,
                         @RequestParam(defaultValue = "1") int pageIndex
                         ) {
        PageInfo pageInfo = new PageInfo();
        pageInfo.setPageIndex(pageIndex);
        pageInfo.setPageSize(2);
        String likeName =  request.getParameter("search");
        pageInfo.setTotalCount(userService.newTotalCount(likeName));
        String PageIndex = request.getParameter("page1");
        if (PageIndex != null) {
            pageInfo.setPageIndex(Integer.parseInt(PageIndex));
        }
        pageInfo.setSearch(request.getParameter("search"));
        List<User> users = userService.Search(pageInfo);
        model.addAttribute("pageInfo", pageInfo);
        System.out.println(request.getParameter("search") + "shishi");
        model.addAttribute("Users", users);

        return "search";
    }

    @PostMapping("/check")
    public String check(@RequestParam(value = "username") String username,
                        @RequestParam(value = "password") String password, Model model) {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
        System.out.println(username + "+++" + password);
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        User user1 = userService.checkUser(user);
        if (user1 != null) {
            return "redirect:findUsers";
        } else {
            return "Login";
        }
    }

    @GetMapping("/toLogin")
    public String toLogin() {
        return "Login";
    }

    @GetMapping("/shishiLogin")
    public String shishiLogin() {
        return "shishi";
    }

    @RequestMapping(value = "check_login", method = RequestMethod.POST)
    @ResponseBody
    public Map checkLogin(
            @RequestParam(value = "username") String username,
            @RequestParam(value = "password") String password) {
        Map<String, Object> map = new HashMap<>();
        // 调用service查询数据库验证登录信息 ......
        User user = userService.newCheck(username, password);
        // 判断用户是否存在
        if (user != null) {
            map.put("message", "success");
            return map;
        } else {
            map.put("message", "fail");
            return map;
        }
    }

    @GetMapping("/shishiTable")
    public String shishiTable() {
        return "bootStarpTable";
    }

    @RequestMapping(value = "Test1", method = RequestMethod.GET)
    @ResponseBody
    public Map Test1(
            @RequestParam(value = "pageSize") Integer pageSize,
            @RequestParam(value = "offset") Integer offset
    ) {
        Map<String, Object> map = new HashMap<>();
        List<User> Users = new ArrayList();
        Users =  userService.findUsers(pageSize,offset);
        Integer total = userService.TotalCount();
        map.put("total",total);
        map.put("rows",Users);
        System.out.println(map);
        return map;


    }





}
