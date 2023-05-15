package com.kbstar.cust;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
public class SelectPageTest {

    @Autowired
    CustService service;

    @Test
    void contextLoads(){
        PageInfo<Cust> pageInfo;
        try {
            pageInfo = new PageInfo<>(service.getPage(1), 5);
            log.info("success");
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
