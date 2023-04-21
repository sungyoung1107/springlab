package com.kbstar.controller;

import com.kbstar.dto.Cust;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    @RequestMapping("/")
    public String main(){
        return "index";
    }
    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String register(Model model, String id, String pwd){
        logger.info("-----" + id+"이고, "+pwd + "-----");
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/registerimpl")
    public String register(Model model, Cust custDTO){
        logger.info("-----" + custDTO.toString() + "-----");
        model.addAttribute("rcust", custDTO);
        model.addAttribute("center", "registerok");
        return "index";
    }

    // /quics?page=bs01
    @RequestMapping("/quics")
    public String quics(String page){
        return page;
    }

}
