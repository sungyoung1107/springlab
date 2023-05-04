package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Cust;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
// insert, delete, update, select, selectall 은 다 mybatis가 해준다.
public interface CustMapper extends KBMapper<String, Cust> {

    Page<Cust> getpage() throws Exception;

}
