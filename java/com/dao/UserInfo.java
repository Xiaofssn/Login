package com.dao;

import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserInfo {

    List<User> selectAll();
    User findById(@Param("user")User user);
}
