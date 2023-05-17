package com.kbstar.util;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class OCRUtil {
    // JSON String으로 받아서 JSON PARSER로 바꾸어서 JSON OBJECT로 반환
    public static Object getResult(String imgpath, String imgname){
        JSONObject obj = null;

        String apiURL = "https://uhucar79op.apigw.ntruss.com/custom/v1/22512/438afcf978eec326d868f679f3e11778756d5d45242a2fcdb54ebc11c6427dbf/infer";
        String secretKey = "YmtqUnNhdklKblhzc0NYSEJySmtRUHV4dlptUERzcnM=";
        String imageFile = imgpath + imgname;

        try {
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoInput(true);
            con.setDoOutput(true);
            con.setReadTimeout(30000);
            con.setRequestMethod("POST");
            String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            con.setRequestProperty("X-OCR-SECRET", secretKey);

            JSONObject json = new JSONObject();
            json.put("version", "V2");
            json.put("requestId", UUID.randomUUID().toString());
            json.put("timestamp", System.currentTimeMillis());
            JSONObject image = new JSONObject();
            image.put("format", "jpg");
            image.put("name", "demo");
            JSONArray images = new JSONArray();
            images.add(image); // JSONArray : put -> add 로 변경
            json.put("images", images);
            String postParams = json.toString();

            con.connect();
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            long start = System.currentTimeMillis();
            File file = new File(imageFile);
            writeMultiPart(wr, postParams, file, boundary); // 서버 전송
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine); // response는 JSON STRING
            }
            br.close();

            // JSON STRING -> JSON OBJECT
            JSONParser parser = new JSONParser();
            obj = (JSONObject) parser.parse(response.toString());

//            System.out.println(response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }

        return obj;
    }

    private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary) throws
            IOException {
        StringBuilder sb = new StringBuilder();
        sb.append("--").append(boundary).append("\r\n");
        sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
        sb.append(jsonMessage);
        sb.append("\r\n");

        out.write(sb.toString().getBytes("UTF-8"));
        out.flush();

        if (file != null && file.isFile()) {
            out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
            StringBuilder fileString = new StringBuilder();
            fileString
                    .append("Content-Disposition:form-data; name=\"file\"; filename=");
            fileString.append("\"" + file.getName() + "\"\r\n");
            fileString.append("Content-Type: application/octet-stream\r\n\r\n");
            out.write(fileString.toString().getBytes("UTF-8"));
            out.flush();

            try (FileInputStream fis = new FileInputStream(file)) {
                byte[] buffer = new byte[8192];
                int count;
                while ((count = fis.read(buffer)) != -1) {
                    out.write(buffer, 0, count);
                }
                out.write("\r\n".getBytes());
            }

            out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
        }
        out.flush();
    }

    public static Map getData(JSONObject obj){
        Map<String, String> map = new HashMap();
        JSONObject jsonObj = obj;
        JSONArray image = (JSONArray) jsonObj.get("images");
        JSONObject jo = (JSONObject) image.get(0);
        JSONArray fields = (JSONArray) jo.get("fields");
        // 5개 배열 돌리기
        for (int i =0; i < fields.size() ; i++){
            Object ele = fields.get(i);
            if (ele instanceof JSONObject) {
                JSONObject item_jo = (JSONObject) ele;
                String name = (String) item_jo.get("name");
                String inferText = (String) item_jo.get("inferText");
                map.put(name, inferText);
            }
        }
        return map;
    }
}
