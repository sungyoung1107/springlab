package com.kbstar.product;


import com.kbstar.dto.Product;
import com.kbstar.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {

    @Autowired
    ProductService service;
    @Test
    void contextLoads() {
//        Date rdate = new Date();
        try {
            service.modify(new Product(333, "감자깡깡이",1000,null, "b.jpg", 1000));
            service.get(333);
            log.info("수정 정상..");
        } catch (Exception e) {
            log.info("오류..");
            //e.printStackTrace(); //어떤 오류인지 자세히

        }
    }

}
