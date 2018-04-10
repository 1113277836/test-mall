package com.hwua.common.dao;

import com.hwua.common.po.User;

import java.util.List;

public interface UserMapper {
    public User login(String username, String password);

    public List<User>queryAllUser();

    public int updateUserIsput(String isput, Integer id);
}
