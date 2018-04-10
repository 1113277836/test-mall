package com.hwua.admin.service.impl;

import com.hwua.admin.service.UserService;
import com.hwua.common.dao.UserMapper;
import com.hwua.common.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User login(String username, String password) {
        return userMapper.login(username, password);
    }

    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public int updateUserIsput(String isput, Integer id) {
        return userMapper.updateUserIsput(isput, id);
    }
}
