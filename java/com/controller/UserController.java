package com.controller;

import com.entity.User;
import com.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

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
    public String findById( User user){
        if(userService.findById(user)){
            return "true";
        }else{
            return "false";
        }
    }

    @ResponseBody
    @RequestMapping(value = "deleteUser")
    public String deleteUser(Integer id){
        if(userService.deleteUser(id)){
            return "true";
        }else{
            return "false";
        }
    }

    @GetMapping(value = "updateUser")
    public String updateUser(Integer uid,ModelMap map){
        User user =new User();
        user.setId(uid);
        User user1=userService.findthisById(user);
        if(user1!=null){
            map.put("obj",user1);
            return "update";
        }else{
            return selectAll(new ModelMap());
        }
    }

    @ResponseBody
    @RequestMapping(value = "updateUser",method = RequestMethod.POST)
    public String updateUser(User user){
        if(userService.updateUser(user)){
            return "true";
        }else{
            return "false";
        }
    }
}
