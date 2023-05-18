package com.kbstar.stock;

import com.kbstar.service.StockService;
import com.kbstar.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class DeleteTest {

    @Autowired
    StockService service;

    @Test
    void contextLoads(){
        int id = 1009;
        try {
            service.remove(id);
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
