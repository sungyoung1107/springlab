package com.kbstar.controller;

import com.kbstar.dto.Product;
import com.kbstar.dto.Stock;
import com.kbstar.dto.User;
import com.kbstar.service.ProductService;
import com.kbstar.service.StockService;
import com.kbstar.service.UserService;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/stock")
public class StockController {

    @Autowired
    StockService stockService;

    @Autowired
    ProductService productService;

    String dir = "stock/";

    @Value("${uploadimgdir}")  // application properties 안에서 설정해준 imgdir 경로를 가져옴
    String imgdir;

    @RequestMapping("/add")
    public String add(Model model) throws Exception {
        // 아이템 정보 불러오기
        List<Product> prolist = productService.get();

        model.addAttribute("prolist", prolist);
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, Stock stock) throws Exception {
        // 등록(변경)시 예상 잔여 재고 수량은 등록 재고 수량과 동일하게 set
        // 추후 조회시 update 됨
        log.info("여기왔니?");
        stock.setProduct_expectedamount(stock.getProduct_amount());
        stockService.register(stock);
        return "redirect:/stock/all";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {

        try {
            stockService.modifyExpectedamount();
        } catch (Exception e) {
            // 예외 무시 - 상품과 재고간 비즈니스 로직 명확히 해야 함
        }

        List<Stock> stockList = null;
        stockList = stockService.selectFinalstock();
//        log.info("=======" + stockList.toString() +"=======");
        model.addAttribute("slist", stockList);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, Integer id) throws Exception {
        List<Stock> list = null;
        list = stockService.selectChangehistory(id);
        model.addAttribute("sdetail", list);
        model.addAttribute("center", dir + "detail");
        return "index";
    }

}
