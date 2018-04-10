package com.hwua.front.service;



import com.hwua.common.po.Member;

import java.util.List;
import java.util.Map;

public interface MemberService {
    public Map<String,Object> login(String username, String password);

    public Member query(String username);

    public Member querybyIdnumber(String id_number);

    public int register(Map<String, Object> map);

    public int amend(Map<String, Object> map);

    public int addAddress(Map<String, Object> map);

    public List<Map<String,Object>> queryAllAddress(Integer id);
}
