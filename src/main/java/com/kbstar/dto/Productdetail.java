package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Productdetail { // 6개의 칼럼
        private int product_id; // 상품의 id(시퀀스)
        private String product_Material; // 상품의 소재 설명 : 14k 골드, 스테인리스..
        private String product_size; // 상품의 사이즈
        private String product_contents; // 상품의 세부내용 설명
        private String product_detail_img1; // 상세 이미지1
        private String product_detail_img2; // 2
        private String product_detail_img3; //최대 3

        // 상품의 상세내용 조회 시 보여줄 화면을 위해 product 테이블과 join한 속성
        private String product_name; // 상품명
        private int product_price; // 상품 가격
        private String product_imgname; // 상품 이미지
        private int  category_id; // 상품의 카테고리 코드(수기등록 ex. 100 : 악세서리(최상위) - 101 : 귀걸리(하위))
        private int  category_sub_id; // 캐쥬얼(1) - 기프트(2) - 웨딩(3) 구분 기준

        public Productdetail(int product_id, String product_Material, String product_size, String product_contents, String product_detail_img1, String product_detail_img2, String product_detail_img3, String product_name, int product_price, String product_imgname, int category_id) {
                this.product_id = product_id;
                this.product_Material = product_Material;
                this.product_size = product_size;
                this.product_contents = product_contents;
                this.product_detail_img1 = product_detail_img1;
                this.product_detail_img2 = product_detail_img2;
                this.product_detail_img3 = product_detail_img3;
                this.product_name = product_name;
                this.product_price = product_price;
                this.product_imgname = product_imgname;
                this.category_id = category_id;
        }
}
