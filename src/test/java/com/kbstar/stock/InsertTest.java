package com.kbstar.stock;

import com.kbstar.dto.Stock;
import com.kbstar.dto.User;
import com.kbstar.service.StockService;
import com.kbstar.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
public class InsertTest {

    @Autowired
    StockService service;

    @Test
    void contextLoads(){
        Stock stock = new Stock(1000, 99999, 1, 1);

        try {
            service.register(stock);
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
