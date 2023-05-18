package com.kbstar.user;

import com.kbstar.dto.User;
import com.kbstar.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Random;

@Slf4j
@SpringBootTest
public class UpdatePwdTest {

    @Autowired
    UserService service;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Test
    void contextLoads(){
        User user = new User();
        //임시 비밀번호 생성 후 셋
        Random random = new Random();
        String checkNum = Integer.toString(random.nextInt(888888) + 111111); /* 0 ~ 888887 */ /* 111111~999998 */
        log.info(checkNum);
        // 임시 비밀번호 암호화
        user.setUser_pwd(encoder.encode(checkNum));

        // id 셋
        user.setUser_id("user100");

        try {
            service.updatePwd(user);
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
