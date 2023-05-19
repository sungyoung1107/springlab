package com.kbstar.service;

import com.kbstar.dto.Productdetail;
import com.kbstar.frame.AespaService;
import com.kbstar.mapper.ProductdetailMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ProductdetailService implements AespaService<Integer, Productdetail> {
    /** 담당 : 정인보
     * 등록 & 가입 진행
     * argument : object
     *
     * @param product
     **/
    @Autowired
    ProductdetailMapper productdetailMapper;
   
    
    // 상품별 상세내용 조회하기
    public Productdetail getselectdetail(int product_id) throws Exception {
        return productdetailMapper.getselectdetail(product_id);
    }

    // 하단은 미사용
    @Override
    public void register(Productdetail productdetail) throws Exception {
        
    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(Productdetail productdetail) throws Exception {

    }

    @Override
    public Productdetail get(Integer integer) throws Exception {
        return null;
    }

    @Override
    public List<Productdetail> get() throws Exception {
        return null;
    }
}
