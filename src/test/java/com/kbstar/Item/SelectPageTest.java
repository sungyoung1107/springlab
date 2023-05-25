package com.kbstar.Item;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectPageTest {
	@Autowired
	ItemService service;

	@Test
	void contextLoads() {
		PageInfo<Item> pageInfo;
		try{
			pageInfo = new PageInfo<>(service.getPage(1), 5);
			log.info("success");
		}catch(Exception e){
			log.info("Error");
			e.printStackTrace();
		}
	}

}
