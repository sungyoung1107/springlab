package com.kbstar.cust;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class InsertTest {

    @Autowired
    CustService service;

    @Test
    void contextLoads(){
        Cust obj = new Cust("id10", "pwd01", "james");
        try {
            service.register(obj);
            log.info("등록 정상");
        } catch (Exception e) {
            log.info("등록 에러");
            e.printStackTrace();
        }
    }
}
