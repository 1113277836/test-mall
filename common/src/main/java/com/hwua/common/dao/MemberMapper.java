package com.hwua.common.dao;

import com.hwua.common.po.Member;

import java.util.List;
import java.util.Map;

public interface MemberMapper {

    public Map<String,Object> queryUser(String username, String password);

    public List<Member>queryAllMember(String status);

    public Member queryById(Integer id);

    public int addMember(Member member);

    public int updateMember(Member member);

    public int deleteMember(String status, Integer id);

    public int stopMember(String isput, Integer id);

    public Member queryByUsername(String username);

    public int doCreate(Map<String, Object> map);

    public int doUpDate(Map<String, Object> map);

    public Member queryById_number(String id_number);

    public int addAddress(Map<String, Object> map);

    public List<Map<String,Object>>queryAllAddress(Integer id);

    public int queryMemberCount();



}
