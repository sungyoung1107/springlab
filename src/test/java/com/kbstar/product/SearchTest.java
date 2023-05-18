package com.kbstar.product;


import com.kbstar.dto.ProductSearch;
import com.kbstar.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SearchTest {

    @Autowired
    ProductService service;
    @Test
    void contextLoads() {

        try {
            ProductSearch ms = new ProductSearch("다이", 10000, "2000/04/01", "2023/05/15");
            service.search(ms);
        } catch (Exception e) {
            log.info("에러..");
        }
    }

}
