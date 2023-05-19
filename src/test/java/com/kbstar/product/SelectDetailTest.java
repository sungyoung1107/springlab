package com.kbstar.product;


import com.kbstar.dto.Productdetail;
import com.kbstar.service.ProductService;
import com.kbstar.service.ProductdetailService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
@Slf4j
public class SelectDetailTest {
    /**
     * 테스트 결과 : 성공!
     * 테스트 실시자 : 정인보
     * 일시 : 5.12
     * 내용 : product_id 단 건 입력하여 selectOne 조회
     * 테스트 정보 : product_id : 1001
     *
     * **/

    @Autowired
    ProductdetailService service;
    @Test
    void contextLoads(){
        try {
                service.getselectdetail(1001);
            log.info("=========== Aespa 판매 상품 중 특정 1건 조회 완료============");
        } catch (Exception e) {
            log.info("에러...");
            e.printStackTrace();
        }
    }
}
