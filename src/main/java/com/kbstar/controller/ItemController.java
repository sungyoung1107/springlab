package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.service.CustService;
import com.kbstar.service.ItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {
    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());

    @Autowired
    ItemService service;
    String dir="item/";

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"center");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("left",dir + "left");
        model.addAttribute("center",dir + "add");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model){

        List<Item> list =null ;
        try {
            list = service.get();
        } catch (Exception e){
            e.printStackTrace();
        }

        model.addAttribute("allitem", list);
        model.addAttribute("left",dir + "left");
        model.addAttribute("center",dir + "all");
        return "index";
    }

}
