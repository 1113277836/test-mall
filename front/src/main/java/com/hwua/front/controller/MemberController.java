package com.hwua.front.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.common.po.Member;
import com.hwua.front.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/login",produces = "application/json;charset=UTF-8")
    public String login(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Map<String, Object> login = memberService.login(username, password);
        System.out.println(JSON.toJSONString(login));
        if(!login.containsKey("error")){
            //成功
            HttpSession session = req.getSession();
            session.setAttribute("username",username);
            Integer id = (Integer) login.get("ID");
            session.setAttribute("id",id);
            session.setAttribute("mid",id);
                return "redirect:/product/list";
        }
       return "login";
    }

    @RequestMapping(value = "/resg",produces = "application/json;charset=UTF-8")
    public String resg(HttpServletRequest req){
        Map<String, String[]> map = req.getParameterMap();
        HashMap<String, Object> param = new HashMap<String,Object>();
        Set<String> keySet = map.keySet();
        for (String key:keySet) {
            param.put(key,map.get(key)[0]);
        }
        System.out.println("param = " + param);
        int register = memberService.register(param);
        return "login";
    }
    @ResponseBody
    @RequestMapping(value = "/resgName",produces = "application/json;charset=UTF-8",method = RequestMethod.POST)
    public String resgName(HttpServletRequest req){
        String username = req.getParameter("username");
        System.out.println("username = " + username);
        JSONObject jsonObject = new JSONObject();
        Member query = memberService.query(username);
        System.out.println("query = " + query);
        if (query!=null) {
            //不可用
            jsonObject.put("msg", "用户名不可用");
        } else {
            //可以
            jsonObject.put("msg", "用户名可用");
        }
        return jsonObject.toJSONString();
    }
    @ResponseBody
    @RequestMapping(value = "/resgNum",produces = "application/json;charset=UTF-8")
    public String resgNum(HttpServletRequest req){
        String id_number = req.getParameter("id_number");
        JSONObject jsonObject = new JSONObject();
        Member member = memberService.querybyIdnumber(id_number);
        if (member==null){
            jsonObject.put("msg","身份证号不正确");
        }else {
            jsonObject.put("msg","身份证号正确");
        }
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "/amend")
    public String amend(HttpServletRequest req)throws ServletException, IOException{
        //获取封装为map的请求参数
        Map<String, String[]> map = req.getParameterMap();
        HashMap<String, Object> param = new HashMap<String,Object>();
        Set<String> keySet = map.keySet();
        for (String key:keySet) {
            param.put(key,map.get(key)[0]);
        }
        System.out.println("param = " + param);
        Member id_number = memberService.querybyIdnumber(param.get("id_number").toString());
        if (id_number!=null){
            int amend = memberService.amend(param);
        }else{
            return "setpassword";
        }
        return "login";
    }
    @RequestMapping(value = "zx")
    public String zx(HttpServletRequest req){
        req.getSession().invalidate();
        return "redirect:/product/list";
    }
    @RequestMapping(value = "toLogin")
    public String toLogin(){
        return "login";
    }
    @RequestMapping(value = "toResg")
    public String toResg(){
        return "register";
    }
    @RequestMapping(value = "toSet")
    public String toSet(){
        return "setpassword";
    }
    @RequestMapping(value = "toAccount")
    public String toAccount(){
        return "account";
    }


}
