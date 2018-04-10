package com.hwua.admin.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.admin.service.UserService;
import com.hwua.common.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
@Autowired
private UserService userService;
    @ResponseBody
    @RequestMapping(value = "/login",produces = "application/json;charset=UTF-8")
    public String login(String username, String password, HttpSession session){
       // password = DigestUtils.md5DigestAsHex(password.getBytes());
        User user = userService.login(username, password);
        System.out.println("user = " + user);
        if (user!=null){
            session.setAttribute("user",user);
            session.setAttribute("username",username);
           // List<Auth> auths = userService.getAuths(user.getDbid());
          //  session.setAttribute("auths",auths);
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg",user!=null);
        return jsonObject.toJSONString();
    }
    @RequestMapping(value = "/zx")
    public String zx(HttpServletRequest req){
        req.getSession().invalidate();
        return "redirect:/login.jsp";
    }
    @RequestMapping(value = "/queryAllUser")
    public String queryAllUser(Map map){
        List<User> users = userService.queryAllUser();
        map.put("users",users);
        return "admin-list";
    }
    @ResponseBody
    @RequestMapping(value = "/jyUser")
    public String updateIsput(Integer id){
        JSONObject jsonObject = new JSONObject();
        int i = userService.updateUserIsput("1", id);
        if (i>0){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
    @ResponseBody
    @RequestMapping(value = "/qyUser")
    public String updateisput(Integer id){
        JSONObject jsonObject = new JSONObject();
        int i = userService.updateUserIsput("0", id);
        if (i>0){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
}
