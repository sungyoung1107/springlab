package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Stock {

    private String stock_updateday;
    private int stock_no;
    private int product_id;
    private int product_costprice;
    private int product_amount;
    private int product_expectedamount;
    // 예상 재고 계산 위함
    private String product_name;
    private int product_price;
    private int stock_rank; // xml 컬럼 추가
    private int cart_quantity;

    public Stock(int product_id, int product_costprice, int product_amount, int product_expectedamount) {
        this.product_id = product_id;
        this.product_costprice = product_costprice;
        this.product_amount = product_amount;
        this.product_expectedamount = product_expectedamount;
    }
}
