package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ProductSearch {
    private String product_name;
    private Integer product_price;
    private String startdate;
    private String enddate;

}
