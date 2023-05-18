package com.kbstar.stock;

import com.kbstar.dto.Stock;
import com.kbstar.dto.User;
import com.kbstar.service.StockService;
import com.kbstar.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class UpdateTest {

    @Autowired
    StockService service;

    @Test
    void contextLoads(){
//        Stock stock = new Stock();
//        stock.setProduct_id(1000);
        try {
            service.modifyExpectedamount();
            service.selectFinalstock();
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
