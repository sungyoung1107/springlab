package com.kbstar.controller;

import com.kbstar.dto.Ncp;
import com.kbstar.util.CFRCelebrityUtil;
import com.kbstar.util.CFRFaceUtil;
import com.kbstar.util.FileUploadUtil;
import com.kbstar.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    CFRCelebrityUtil celebrityUtil;
    @Autowired
    CFRFaceUtil cfrFaceUtil;


    @RequestMapping("/cfr1impl")
    public String cfr1impl(Model model, Ncp ncp) throws ParseException {
        // 화면에서 이미지를 서버로 올린다.
        // 이미지를 저장한다.
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        log.info("============== " + ncp.getImg()); // ============== org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@20ee25f3
        // 네이버에게 물어본다. ncp에 요청 한다.
        String imgname = ncp.getImg().getOriginalFilename();
        log.info("============== " + ncp.getImg().getOriginalFilename()); // ============== mavely.jpg
        JSONObject result = (JSONObject) celebrityUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        // {"faces":[{"celebrity":{"confidence":1.0,"value":"마동석"}}],"info":{"size":{"width":500,"height":626},"faceCount":1}}
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
        JSONObject result = (JSONObject) cfrFaceUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        // {"faces":[{"emotion":{"confidence":0.9932,"value":"smile"},"gender":{"confidence":0.999996,"value":"male"},"pose":{"confidence":0.999166,"value":"frontal_face"},"landmark":{"nose":{"x":255,"y":264},"rightMouth":{"x":299,"y":310},"rightEye":{"x":304,"y":192},"leftMouth":{"x":207,"y":307},"leftEye":{"x":204,"y":195}},"roi":{"x":137,"width":256,"y":131,"height":256},"age":{"confidence":0.70313,"value":"44~48"}}],"info":{"size":{"width":500,"height":626},"faceCount":1}}
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

        JSONObject result = (JSONObject) cfrFaceUtil.getResult(imgpath, imgname);
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

    @RequestMapping("/ocr1impl")
    public String ocr1impl(Model model, Ncp ncp) throws ParseException {
        // 화면에서 이미지를 서버로 올린다.
        // 이미지를 저장한다.
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        log.info("============== " + ncp.getImg());

        String imgname = ncp.getImg().getOriginalFilename();
        log.info("============== " + ncp.getImg().getOriginalFilename()); // ============== biz2.jpg

        JSONObject jo = (JSONObject) OCRUtil.getResult(imgpath, imgname);
        Map result = OCRUtil.getData(jo);

        model.addAttribute("center", "ocr1");
        model.addAttribute("result", result);
        return "index";
    }

    @RequestMapping("/ocr2impl")
    public String ocr2impl(Model model, Ncp ncp) throws ParseException {
        // 화면에서 이미지를 서버로 올린다.
        // 이미지를 저장한다.
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        log.info("============== " + ncp.getImg());

        String imgname = ncp.getImg().getOriginalFilename();
        log.info("============== " + ncp.getImg().getOriginalFilename()); // ============== biz2.jpg

        JSONObject jo = (JSONObject) OCRUtil.getResult(imgpath, imgname);
        Map result = OCRUtil.getData(jo);

        model.addAttribute("center", "ocr2");
        model.addAttribute("result", result);
        return "index";
    }

}
