package com.hwua.front.service.impl;


import com.hwua.common.dao.MemberMapper;
import com.hwua.common.po.Member;
import com.hwua.front.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("memberService")
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;

@Override
    public Map<String,Object> login(String username, String password) {
        Map<String, Object> map = memberMapper.queryUser(username, password);
        if(map == null) {
            map = new HashMap<String,Object>();
            //登录失败
            Member map2 = memberMapper.queryByUsername(username);
            if(map2 == null) {
                //用户名不存在
                map.put("error", "用户名不存在");
            }else {
                //密码错误
                map.put("error", "密码错误");
            }
        }
        return map;
    }
@Override
    public Member query(String username) {
        return memberMapper.queryByUsername(username);
    }

@Override
    public Member querybyIdnumber(String id_number) {
        return memberMapper.queryById_number(id_number);
    }
@Override
    public int register(Map<String,Object>map) {
        Map<String,Object> map2 = new HashMap<String,Object>();
        if(map2.get("USERNAME")!=null) {
            return 0;
        }else {
            return memberMapper.doCreate(map);
        }
    }
    public int amend(Map<String,Object>map) {
        return memberMapper.doUpDate(map);
    }
@Override
    public int addAddress(Map<String,Object>map){return memberMapper.addAddress(map);}

    @Override
    public List<Map<String, Object>> queryAllAddress(Integer id) {
        return memberMapper.queryAllAddress(id);
    }
}
