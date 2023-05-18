package com.kbstar.service;


import com.kbstar.dto.Stock;
import com.kbstar.dto.User;
import com.kbstar.frame.AespaService;
import com.kbstar.mapper.StockMapper;
import com.kbstar.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class StockService implements AespaService<Integer, Stock> {

    @Autowired
    StockMapper mapper;

    // update 겸용으로 쓸 예정
    @Override
    public void register(Stock stock) throws Exception {
        mapper.insert(stock);
    }

    @Override
    public void remove(Integer s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Stock stock) throws Exception {
        mapper.update(stock);
    }

    // 기본 select 사용안함
    @Override
    public Stock get(Integer s) throws Exception {
        return mapper.select(s);
    }

    //  product_id로 조회시 변경등록일자가 있는 List<Stock> 반환
    public List<Stock> selectChangehistory(Integer s) throws Exception {
        return mapper.selectchangehistory(s);
    }

    // 변경등록일자가 있는 List<Stock> 반환
    @Override
    public List<Stock> get() throws Exception {
        return mapper.selectall();
    }

    // 상품 전체 최종 재고 현황
    public List<Stock> selectFinalstock() throws Exception {
        return mapper.selectfinalstock();
    }

    // 장바구니 갯수로 예상 재고 계산 업데이트
    public void modifyExpectedamount() throws Exception {
        mapper.updateexpectedamount();
    }
    // 재고 부족 리스트
    public List<Stock> getLowstock() throws Exception {
        return mapper.getlowstock();
    }

}
