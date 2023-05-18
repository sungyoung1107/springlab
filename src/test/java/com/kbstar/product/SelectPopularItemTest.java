package com.kbstar.product;


import com.kbstar.dto.Product;
import com.kbstar.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class SelectPopularItemTest {

    @Autowired
    ProductService service;
    @Test
    void contextLoads() {
        List<Product> list = null;
        try {
            list = service.selectPopularitem();
            log.info(list.toString());
            log.info("수정 정상..");
        } catch (Exception e) {
            e.printStackTrace();
            log.info("오류..");
            //e.printStackTrace(); //어떤 오류인지 자세히

        }
    }

}
