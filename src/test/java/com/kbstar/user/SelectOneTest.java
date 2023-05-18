package com.kbstar.user;

import com.kbstar.dto.User;
import com.kbstar.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class SelectOneTest {

    @Autowired
    UserService service;

    @Test
    void contextLoads(){
        String id = "user01";
        User user = null;
        try {
            user = service.get(id);
            log.info("------------------------");
            log.info(user.toString());
            log.info("------------------------");
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
