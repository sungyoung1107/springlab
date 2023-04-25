package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Marker;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.yaml.snakeyaml.error.Mark;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RestController
public class AjaxImplController {
    @RequestMapping("/getservertime")
    public Object getservertime(){
        Date date = new Date();
        return date;
    }

    @RequestMapping("/checkid")
    public int checkid(String id){
        int result = 0;
        if(id.equals("qqqq")||id.equals("aaaa")||id.equals("ssss")){
            result = 1;
        }
        return result;
    }
    @RequestMapping("/getdata")
    public Object getdata(){
        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01", "pwd01", "james1"));
        list.add(new Cust("id02", "pwd02", "james2"));
        list.add(new Cust("id03", "pwd03", "james3"));
        list.add(new Cust("id04", "pwd04", "james4"));
        list.add(new Cust("id05", "pwd05", "james5"));

        JSONArray ja = new JSONArray();
        // JSON (Javascript Object Notation)
        // [{}, {}, {}, ...]
        for (Cust obj : list){
            JSONObject jo = new JSONObject();
            Random r = new Random();
            int i = r.nextInt(100)+1;
            jo.put("id", obj.getId());
            jo.put("pwd", obj.getPwd());
            jo.put("name", obj.getName()+i);
            ja.add(jo);
        }
        return ja;
    }

    @RequestMapping("/markers")
    public Object markers(String loc){
        List<Marker> list = new ArrayList<>();

        if(loc.equals("s")){
            list.add(new Marker(100, "국밥", "http://www.nate.com", 37.5823666, 126.9770590, "a.jpg", "s"));
            list.add(new Marker(101, "떡볶이", "http://www.nate.com", 37.6023666, 126.9870590, "b.jpg", "s"));
            list.add(new Marker(102, "오므라이스", "http://www.nate.com", 37.5923666, 126.9670590, "c.jpg", "s"));
        }else if(loc.equals("b")){
            list.add(new Marker(103, "국밥", "http://www.nate.com", 35.1474458, 129.0656677, "a.jpg", "s"));
            list.add(new Marker(104, "떡볶이", "http://www.nate.com", 35.1494458, 129.0856677, "b.jpg", "b"));
            list.add(new Marker(105, "오므라이스", "http://www.nate.com", 35.1491458, 129.0855077,  "c.jpg", "b"));
        }else if(loc.equals("j")){
            list.add(new Marker(106, "떡볶이", "http://www.nate.com", 35.1548545, 129.0645698, "b.jpg", "j"));
            list.add(new Marker(107, "오므라이스", "http://www.nate.com", 35.1548595, 129.0645898,  "c.jpg", "j"));
            list.add(new Marker(108, "오므라이스", "http://www.nate.com", 35.1548575, 129.0645798,  "c.jpg", "j"));
        }
        JSONArray ja = new JSONArray();
        for (Marker obj : list){
            JSONObject jo = new JSONObject();
            jo.put("id", obj.getId());
            jo.put("title", obj.getTitle());
            jo.put("target", obj.getTarget());
            jo.put("lat", obj.getLat());
            jo.put("lng", obj.getLng());
            jo.put("img", obj.getImg());
            jo.put("log", obj.getLog());
            ja.add(jo);
        }
        return ja;
    }


}
