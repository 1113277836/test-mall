package com.hwua.admin.service.impl;

import com.hwua.admin.service.MemberService;
import com.hwua.common.dao.MemberMapper;
import com.hwua.common.po.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("memberService")
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;
    @Override
    public List<Member> queryAllMember(String status) {
        return memberMapper.queryAllMember(status);
    }

    @Override
    public int deleteMember(String status, Integer id) {
        return memberMapper.deleteMember(status,id);
    }

    @Override
    public int stopMember(String isput, Integer id) {
        return memberMapper.stopMember(isput, id);
    }

    @Override
    public int addMember(Member member) {
        return memberMapper.addMember(member);
    }

    @Override
    public int updateMember(Member member) {
        return memberMapper.updateMember(member);
    }

    @Override
    public Member queryById(Integer id) {
        return memberMapper.queryById(id);
    }

    @Override
    public int queryMemberCount() {
        return memberMapper.queryMemberCount();
    }
}
