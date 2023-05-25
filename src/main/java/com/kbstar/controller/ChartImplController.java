package com.kbstar.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
public class ChartImplController {

//    @RequestMapping("/chart02")
//    public Object chart02(){
//        // [1,2,3]
//        JSONArray ja = new JSONArray();
//        for(int i=1; i <=12; i++){
//            Random r = new Random();
//            int cnt = r.nextInt(10000)+1;
//            ja.add(cnt);
//        }
//        return ja;
//    }

    @RequestMapping("/chart02")
    public Object chart02(){
        // {'categort':[], 'datas':[]}
        JSONObject jo = new JSONObject();

        JSONArray jaCnt = new JSONArray();
        for(int i=1; i <=12; i++){
            Random r = new Random();
            int cnt = r.nextInt(10000)+1;
            jaCnt.add(cnt);
        }
        JSONArray jaYear = new JSONArray();
        for(int i=2011; i < 2023 ; i++){
            jaYear.add(i);
        }

        jo.put("category", jaYear);
        jo.put("datas", jaCnt);
        return jo;
    }

    @RequestMapping("/chart0301")
    public Object chart0301(){
        // [[],[]]
        JSONArray ja = new JSONArray();

        for(int i=0 ; i<5 ;i++){
            Random rd = new Random();
            int num = rd.nextInt(20) + 1;
            JSONArray jadata = new JSONArray();
            jadata.add("data" +num);
            jadata.add(num);
            ja.add(jadata);
        }

        return ja;
    }

    @RequestMapping("/chart0302")
    public Object chart0302(){
        // [{}, {}]
        JSONArray ja = new JSONArray();

        for (int i =0 ; i<15; i++){
            JSONObject jo = new JSONObject();
            Random rd = new Random();
            int x = rd.nextInt(99)+1;
            int y = rd.nextInt(99)+1;
            int z = rd.nextInt(99)+1;
            jo.put("x", x);
            jo.put("y", y);
            jo.put("z", z);
            jo.put("name", "name"+(x+y+z));
            jo.put("country", "country"+(x+y+z));
            ja.add(jo);
        }
        return ja;
    }
    @RequestMapping("/chart0303")
    public Object chart0303(){
        // [[],[]]
        JSONArray ja = new JSONArray();

        for(int i=0 ; i<8 ;i++){
            JSONArray jadata = new JSONArray();

            // 랜덤 숫자
            Random rd = new Random();
            int num = rd.nextInt(1000) + 1;

            // 랜덤 색깔
            int red = rd.nextInt(256);
            int green = rd.nextInt(256);
            int blue = rd.nextInt(256);
            // 밝은 색상 선택
            while((red+green+blue)<382){
                red = rd.nextInt(256);
                green = rd.nextInt(256);
                blue = rd.nextInt(256);
            }
            String colorCode = String.format("#%02x%02x%02x", red, green, blue);
            jadata.add("head" +num);
            jadata.add(num);
            jadata.add(colorCode);
            jadata.add("tail" +num);
            ja.add(jadata);
        }

        return ja;
    }

}
