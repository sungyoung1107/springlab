package com.kbstar.controller;

import com.kbstar.dto.Product;
import com.kbstar.dto.Stock;
import com.kbstar.service.ProductService;
import com.kbstar.service.StockService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/charts")
public class ChartController {

    @Autowired
    StockService stockService;

    @Autowired
    ProductService productService;

    String dir = "chart/";

    @Value("${uploadimgdir}")  // application properties 안에서 설정해준 imgdir 경로를 가져옴
    String imgdir;

    @RequestMapping("/stock")
    public String stock(Model model) {
        model.addAttribute("center", dir + "stock");
        return "index";
    }

    @RequestMapping("/stockimpl")
    @ResponseBody // json 반환
    public Object stockimpl(Model model) throws Exception {

        try {
            stockService.modifyExpectedamount();
        } catch (Exception e) {
            // 예외 무시 - 상품과 재고간 비즈니스 로직 명확히 해야 함
        }

        List<Stock> list = null;
        list = stockService.getLowstock();

        /*
        let jo = {
                categories:[],
                data1:[]
                data2:[]
         }
         */
        JSONObject jo = new JSONObject();

        // 카테고리 데이터
        // categories = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        // data1: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, 22.8, 17.5, 12.1, 7.6];
        // data2: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, 22.8, 17.5, 12.1, 7.6];
        JSONArray categories = new JSONArray();
        JSONArray amount = new JSONArray();
        JSONArray expectedAmount = new JSONArray();
        for (Stock item : list) {
            categories.add(item.getProduct_name());
            amount.add(item.getProduct_amount());
            expectedAmount.add(item.getProduct_expectedamount());
        }
        jo.put("categories", categories);
        jo.put("amount", amount);
        jo.put("expectedamount", expectedAmount);

        return jo;
    }
    @RequestMapping("/popular")
    @ResponseBody // json 반환
    public Object popular(Model model) throws Exception {

        List<Product> list = null;
        try {
            list = productService.selectPopularitem();
        } catch (Exception e) {
            // 예외 무시 - 상품과 재고간 비즈니스 로직 명확히 해야 함
        }
        /*
        let jo = {
                1 : "ㅇㅇㅇㅇ",
                2 : "ㅇㅇㅇㅇ"
         }
         */
        JSONObject jo = new JSONObject();
        // 1위~4위 상품 넣기
        for (Product item : list){
            if(item.getRank()==1){
                jo.put("1위", item.getProduct_name());
                jo.put("1위수량", item.getCart_quantity());
            }
            if(item.getRank()==2){
                jo.put("2위", item.getProduct_name());
                jo.put("2위수량", item.getCart_quantity());
            }
            if(item.getRank()==3){
                jo.put("3위", item.getProduct_name());
                jo.put("3위수량", item.getCart_quantity());
            }
            if(item.getRank()==4){
                jo.put("4위", item.getProduct_name());
                jo.put("4위수량", item.getCart_quantity());
            }
        }

        return jo;
    }
}

//        List<Sales> list = null;
//        list = salesService.groupsales();
//
//        data : { categories:[],
//                 data: []}
//        JSONObject joData = new JSONObject();
//
//        // 월 매출액
//        JSONArray jaLabel = new JSONArray();
//        for(int i =1 ; i <13 ; i++) {
//            jaLabel.add(i);
//        }
//        JSONObject joInnerData = new JSONObject();
//        // innerdata
//        JSONArray jaInnerData = new JSONArray();
//        for (Sales sales : list){
//            // 매출액이 없는 경우 0으로 세팅
//            if(sales.getPrice() == null || sales.getPrice() == 0){
//                jaInnerData.add(0);
//                continue; // 아래구문 패스
//            }
//            jaInnerData.add(sales.getPrice()); // 매출액이 있는 경우 매출액 set
//        } // [XXX, XXX, XXX, ....]
//        joInnerData.put("data", joInnerData); // {data: []}
//
//        // datasets
//        JSONArray jaDatasets = new JSONArray();
//        jaDatasets.add(joInnerData); // [{data: []}]
//
//        joData.put("labels", jaLabel); // labels : [1,2,3,4,5,6,7,8,9,10,11,12]
//        joData.put("datasets", jaDatasets); // datasets: [{data: []}]
//
//        return joData;



