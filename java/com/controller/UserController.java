package com.controller;

import com.entity.User;
import com.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/")
public class UserController {

    @Resource
    private UserService userService;

    //查询所有用户
    @RequestMapping("selectAll")
    public String selectAll(ModelMap map){
        map.put("userlist",userService.selectAll());
        return "userList";
    }

    //登录验证
    @ResponseBody
    @RequestMapping(value = "findById",method = RequestMethod.POST)
    public String findById(User user){
        if(userService.findById(user)){
            return "true";
        }else{
            return "false";
        }
    }
}
