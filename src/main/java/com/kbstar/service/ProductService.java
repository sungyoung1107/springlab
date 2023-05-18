package com.kbstar.service;

import com.kbstar.dto.Product;
import com.kbstar.dto.ProductSearch;
import com.kbstar.frame.AespaService;
import com.kbstar.mapper.ProductMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j  //log
@Service
public class ProductService implements AespaService<Integer, Product> {
    /**
     * 등록 & 가입 진행
     * argument : object
     * return : null
     *
     * @param product
     **/

    @Autowired
    ProductMapper mapper;

    @Override
    public void register(Product product) throws Exception {
        mapper.insert(product);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(Product product) throws Exception {
        mapper.update(product);
    }

    @Override
    public Product get(Integer i) throws Exception {
        return mapper.select(i);
    }

    @Override
    public List<Product> get() throws Exception {
        return mapper.selectall();
    }

    public List<Product> search(ProductSearch ms) throws Exception{
        return mapper.search(ms);
    }

    // 오늘 날짜 인기 상품 순서 추출
    public  List<Product> selectPopularitem() throws Exception {
        return mapper.selectpopularitem();
    }

}