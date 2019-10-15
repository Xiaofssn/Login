package com.service;

import com.dao.UserInfo;
import com.entity.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class UserService {

    @Resource
    private UserInfo userInfo;

    //查询所有
    public List<User> selectAll(){
        return userInfo.selectAll();
    }

    //用户名和密码查询
    public boolean findById(User user){
        if(userInfo.findById(user)!=null){
            return true;
        }else{
            return false;
        }
    }
}
