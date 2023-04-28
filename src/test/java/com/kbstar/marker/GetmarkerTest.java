package com.kbstar.marker;

import com.kbstar.service.MarkerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class GetmarkerTest {
    @Autowired
    MarkerService service;

    @Test
    void contextLoads() {

        try{
            service.getmarker("S");
            service.getmarker("B");
            service.getmarker("J");
            log.info("Success");
        }catch(Exception e){
            log.info("Error");
            e.printStackTrace();
        }

    }

}
