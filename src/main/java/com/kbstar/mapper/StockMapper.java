package com.kbstar.mapper;

import com.kbstar.dto.Stock;
import com.kbstar.dto.User;
import com.kbstar.frame.AespaMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface StockMapper extends AespaMapper<Integer, Stock> {

    public List<Stock> selectchangehistory(Integer product_id) throws Exception; // product_id로 조회시 변경등록일자가 있는 List<Stock> 반환
    public List<Stock> selectfinalstock() throws Exception; // 최종 재고 현황
    public void updateexpectedamount() throws Exception; // 장바구니 갯수로 예상 재고 계산 업데이트
    public List<Stock> getlowstock() throws Exception; // 재고가 1개 미만이거나 입고 처리를 안한 것 출력
}
