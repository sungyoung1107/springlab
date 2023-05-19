package com.kbstar.product;


import com.kbstar.dto.ProductSearch;
import com.kbstar.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
@Slf4j
public class SearchTest {
    @Autowired
    ProductService service;
    @Test
    void contextLoads(){
        ProductSearch ms = new ProductSearch("링");
        try {
                service.search(ms);
            log.info("=========== 판매 상품 검색 완료============");
        } catch (Exception e) {
            log.info("에러...");
            e.printStackTrace();
        }
    }
}
