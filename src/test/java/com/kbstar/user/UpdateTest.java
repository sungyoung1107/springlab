package com.kbstar.user;

import com.kbstar.dto.User;
import com.kbstar.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class UpdateTest {

    @Autowired
    UserService service;

    @Test
    void contextLoads(){
        User user = new User("admin03", "이몽치", "F", "010-0000-0000", "광명", "1990-03-01" );
        try {
            service.modify(user);
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
