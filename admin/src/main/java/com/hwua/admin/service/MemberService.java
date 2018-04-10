package com.hwua.admin.service;

import com.hwua.common.po.Member;

import java.util.List;

public interface MemberService {
    public List<Member>queryAllMember(String status);

    public int deleteMember(String status, Integer id);

    public int stopMember(String isput, Integer id);

    public int addMember(Member member);

    public int updateMember(Member member);

    public Member queryById(Integer id);

    public int queryMemberCount();
}
