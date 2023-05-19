package com.kbstar.mapper;

import com.kbstar.dto.Product;
import com.kbstar.dto.Productdetail;
import com.kbstar.frame.AespaMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ProductdetailMapper extends AespaMapper<Integer, Productdetail> {
    // 아이템id에 해당하는 정보 상세보기.
    public Productdetail getselectdetail(int product_id);
}