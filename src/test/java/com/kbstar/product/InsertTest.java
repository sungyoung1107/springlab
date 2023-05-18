package com.kbstar.product;//package com.kbstar.user;


import com.kbstar.dto.Product;
import com.kbstar.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
public class InsertTest {

    @Autowired
    ProductService service;

    @Test
    void contextLoads(){
        Product obj =
                new Product(0, "testproduct", 10000, null, "a.jpg", 104);
        try {
            service.register(obj);
            log.info("등록 정상");
        } catch (Exception e) {
            // 객체 비교 (예외상황 객체 비교)
            if(e instanceof DuplicateKeyException){
                log.info("ID가 중복 되었습니다");
            }else {
                log.info("시스템 장애입니다.");
            }
          // e.printStackTrace();
        }
    }
}
