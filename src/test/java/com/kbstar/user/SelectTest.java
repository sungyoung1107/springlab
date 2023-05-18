package com.kbstar.user;

import com.kbstar.dto.User;
import com.kbstar.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
public class SelectTest {

    @Autowired
    UserService service;

    @Test
    void contextLoads(){
        List<User> list = null;
        try {
            list = service.get();
            log.info(list.toString());
            service.get();
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
