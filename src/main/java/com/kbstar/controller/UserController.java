package com.kbstar.controller;

import com.kbstar.dto.Product;
import com.kbstar.dto.User;
import com.kbstar.service.ProductService;
import com.kbstar.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    BCryptPasswordEncoder encoder;

    String dir = "user/";

    @Value("${uploadimgdir}")  // application properties 안에서 설정해준 imgdir 경로를 가져옴
    String imgdir;

    @RequestMapping("/all")
    public String main(Model model) throws Exception {
        List<User> list = null;
        list = userService.get();
        model.addAttribute("clist", list);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/cartInfo")
    public String cartInfo(Model model) throws Exception {
        List<User> list = null;
        list = userService.getAllusercart();
        model.addAttribute("ccartlist", list);
        model.addAttribute("center", dir + "cartinfo");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, String id) throws Exception {
        User user = null;
        user = userService.get(id);
        model.addAttribute("cdetail", user);
        model.addAttribute("center", dir+"detail");
        return "index";
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, String id) throws Exception {
        userService.remove(id);
        return "redirect:/user/all";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, User user, Errors errors) throws Exception {
//        userService.modify(user);
        log.info(String.valueOf(user));
        if(errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();
            String msg="";
            for(ObjectError e: es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
//        user.setUser_pwd(encoder.encode(user.getUser_pwd()));
        userService.modify(user);
        return "redirect:/user/detail?id="+user.getUser_id();
    }

}
