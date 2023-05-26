package com.kbstar.enc;

import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Slf4j
@SpringBootTest
class EncTest2 {

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Test
    void contextLoads() {
        StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor();
        pbeEnc.setAlgorithm("PBEWithMD5AndDES"); // 알고리즘의 이름
        pbeEnc.setPassword("mykey");

        String phone = "01012345678";
        String addr = "서울시 성동구 성수동 172-5";

        // 암호화
        String encPhone = pbeEnc.encrypt(phone);
        log.info("======================= Enc Phone :" + encPhone);
        String encAddr = pbeEnc.encrypt(addr);
        log.info("======================= Enc Addr :" + encAddr);

        // 복호화
        String decPhone = pbeEnc.decrypt(encPhone);
        log.info("======================= Dec Phone :" + decPhone);
        String decAddr = pbeEnc.decrypt(encAddr);
        log.info("======================= Dec Addr :" + decAddr);

    }

}
