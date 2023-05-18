package com.kbstar.mapper;



import com.kbstar.dto.Product;
import com.kbstar.dto.ProductSearch;
import com.kbstar.frame.AespaMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ProductMapper extends AespaMapper<Integer, Product> {
    public List<Product> search(ProductSearch ms);
    public List<Product> selectpopularitem(); // 오늘 날짜 인기 상품 순서 추출

}
