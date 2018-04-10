package com.hwua.admin.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.admin.service.MemberService;
import com.hwua.common.po.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    @RequestMapping(value = "/queryAllMember")
    public String queryAllMember(Map map){
        List<Member> members = memberService.queryAllMember("0");
        int i = memberService.queryMemberCount();
        System.out.println("members = " + members);
        map.put("i",i);
        map.put("members",members);
        return "member-list";
    }
    @RequestMapping(value = "/queryById",method = RequestMethod.GET)
    public String queryById(Map map,Integer id){
        Member member = memberService.queryById(id);
        System.out.println("member = " + member);
        map.put("member",member);
        return "member-add";
    }
    @RequestMapping(value = "/queryAllDeleteMember")
    public String queryAllDeleteMember(Map map){
        List<Member> members = memberService.queryAllMember("1");
        System.out.println("members = " + members);
        map.put("members",members);
        return "member-del";
    }
    @ResponseBody
    @RequestMapping(value = "/deleteMember",produces = "application/json;charset=UTF-8")
    public String deleteMember(Integer id){
        JSONObject jsonObject = new JSONObject();
        int i = memberService.deleteMember("1", id);
        if (i>0){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
    @ResponseBody
    @RequestMapping(value = "/renewMember",produces = "application/json;charset=UTF-8")
    public String renewMember(Integer id){
        JSONObject jsonObject = new JSONObject();
        int i = memberService.deleteMember("0", id);
        if (i>0){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
    @ResponseBody
    @RequestMapping(value = "/stopMember",produces = "application/json;charset=UTF-8")
    public String stopMember(Integer id){
        JSONObject jsonObject = new JSONObject();
        int i = memberService.stopMember("1", id);
        if (i>0){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
    @ResponseBody
    @RequestMapping(value = "/beginMember",produces = "application/json;charset=UTF-8")
    public String beginMember(Integer id){
        JSONObject jsonObject = new JSONObject();
        int i = memberService.stopMember("0", id);
        if (i>0){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
    @RequestMapping(value = "/toAddMember",produces = "application/json;charset=UTF-8")
    public String toAddMember(){
        return "member-add";
    }

    @RequestMapping(value = "/addOrUpdateMember")
    public String addMember(Member member){
        System.out.println("member = " + member);
        JSONObject jsonObject = new JSONObject();
        if (member.getId()!=null){
            int i = memberService.updateMember(member);
            if (i>0){
                jsonObject.put("msg",true);
            }else {
                jsonObject.put("msg",false);
            }
        }else {
            int i = memberService.addMember(member);
            if (i>0){
                jsonObject.put("msg",true);
            }else {
                jsonObject.put("msg",false);
            }
        }
        return "redirect:queryAllMember";
    }
}
