package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
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
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {
    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());

    @Autowired
    ItemService itemService;
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
    public String all(Model model) throws Exception {

        List<Item> list =null ;
        try {
            list = itemService.get();
        } catch (Exception e){
            throw new Exception("시스템 장애 : EX0002");
        }

        model.addAttribute("allitem", list);
        model.addAttribute("left",dir + "left");
        model.addAttribute("center",dir + "all");
        return "index";
    }

    @RequestMapping("/allpage")
    // pageNo를 화면에서 받을 것인데 안받았다면 1을 default로 할거야!
    public String allpage(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {

        PageInfo<Item> p;

        try {
            p = new PageInfo<>(itemService.getPage(pageNo), 5);
        } catch (Exception e){
            throw new Exception("시스템 장애 : EX0002");
        }

        model.addAttribute("target", "item");
        model.addAttribute("cpage", p);
        model.addAttribute("left",dir + "left");
        model.addAttribute("center",dir + "allpage");
        return "index";
    }

}
