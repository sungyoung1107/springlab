package com.kbstar.controller;

import com.kbstar.dto.Ncp;
import com.kbstar.util.CFRCelebrityUtil;
import com.kbstar.util.CFRFaceUtil;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class NcpController {

    @Value("${uploadimgdir}")
    String imgpath;

    @RequestMapping("/cfr1impl")
    public String cfr1impl(Model model, Ncp ncp) throws ParseException {
        // 화면에서 이미지를 서버로 올린다.
        // 이미지를 저장한다.
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        // 네이버에게 물어본다. ncp에 요청 한다.
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result = (JSONObject) CFRCelebrityUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);
        JSONObject celebrity = (JSONObject) obj.get("celebrity");
        String value = (String) celebrity.get("value");

        // 결과를 받는다.
        model.addAttribute("center", "cfr1");
        model.addAttribute("result", value);
        return "index";
    }

    @RequestMapping("/cfr2imp1")
    public String cfr2imp1(Model model, Ncp ncp) throws ParseException {
        // 화면에서 이미지를 서버로 올린다.
        // 이미지를 저장한다.
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        // 네이버에게 물어본다. ncp에게 요청을 한다.
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result = (JSONObject) CFRFaceUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);
        JSONObject emotion_jo = (JSONObject) obj.get("emotion");
        JSONObject gender_jo = (JSONObject) obj.get("gender");
        JSONObject pose_jo = (JSONObject) obj.get("pose");
        JSONObject age_jo = (JSONObject) obj.get("age");

        String emotion_value = "";
        String gender_value = "";
        String pose_value = "" ;
        String age_value = "";

        emotion_value = (String) emotion_jo.get("value");
        gender_value = (String) gender_jo.get("value");
        pose_value = (String) pose_jo.get("value");
        age_value = (String) age_jo.get("value");

        log.info("=========="+ emotion_value + "==========");
        log.info("=========="+ gender_value + "==========");
        log.info("=========="+ pose_value + "==========");
        log.info("=========="+ age_value + "==========");

        Map<String, String> map = new HashMap<>();
        map.put("emotion", emotion_value);
        map.put("gender", gender_value);
        map.put("pose", pose_value);
        map.put("age", age_value);

        // 결과를 받는다.
        model.addAttribute("result", map);
        model.addAttribute("center", "cfr2");

        return "index";
    }

    @RequestMapping("/mycfr")
    public String mycfr(Model model, String imgname) throws ParseException {

        JSONObject result = (JSONObject) CFRFaceUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);
        JSONObject emotion_jo = (JSONObject) obj.get("emotion");
        JSONObject gender_jo = (JSONObject) obj.get("gender");
        JSONObject pose_jo = (JSONObject) obj.get("pose");
        JSONObject age_jo = (JSONObject) obj.get("age");

        String emotion_value = "";
        String gender_value = "";
        String pose_value = "" ;
        String age_value = "";

        emotion_value = (String) emotion_jo.get("value");
        gender_value = (String) gender_jo.get("value");
        pose_value = (String) pose_jo.get("value");
        age_value = (String) age_jo.get("value");

        log.info("=========="+ emotion_value + "==========");
        log.info("=========="+ gender_value + "==========");
        log.info("=========="+ pose_value + "==========");
        log.info("=========="+ age_value + "==========");

        Map<String, String> map = new HashMap<>();
        map.put("emotion", emotion_value);
        map.put("gender", gender_value);
        map.put("pose", pose_value);
        map.put("age", age_value);

        // 결과를 받는다.
        model.addAttribute("result", map);
        model.addAttribute("center", "pic");

        return "index";
    }

}
