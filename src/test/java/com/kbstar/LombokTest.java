package com.kbstar;

import com.kbstar.dto.CustDTO;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class LombokTest {

    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());

//    int i = 10;
    @Test
    void contextLoad() {

//        System.out.println("i는 "+ i); // 절대 쓰지 말자
        CustDTO cust = new CustDTO("id01", "pwd01", "이말숙");
        logger.info(cust.toString());
    }
}
