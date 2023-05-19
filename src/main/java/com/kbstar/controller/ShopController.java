package com.kbstar.controller;


import com.kbstar.dto.Cart;
import com.kbstar.dto.Product;
import com.kbstar.dto.Productdetail;
import com.kbstar.service.CartService;
import com.kbstar.service.ProductService;
import com.kbstar.service.ProductdetailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

// 컨트롤러 설명 : Product에 대한 기능을 담당하는 곳.
// 상품 전체조회, 카테고리별 상품조회 등
@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {

    @Autowired
    ProductService productService;
    @Autowired
    ProductdetailService productdetailService;
    @Autowired
    CartService cartService;

    @Value("${uploadimgdir}") // 이렇게 세팅하면, 애플리케이션 프로퍼티에  정해둔, simg/ 폴더에 집어넣는다.
    String imgdir;
    String dir = "shop/";



    // 1-1 기본페이지 :상품 전체조회(한눈에보기 화면) : 127.0.0.1/shop
    // 1-2. 각 상품에 대한 상세조회는 별도 페이지 x. 전체조회 페이지에서 모달창 활용.
    @RequestMapping("")
    public String main(Model model) throws Exception {
        // selectAll 사용
        List<Product> list = null;

        try {
            list = productService.get();

        } catch (Exception e) {
            throw new Exception("/shop 상품 전체조회 중 오류가 발생했습니다.");
        }
        // list에 담은 Product를 브라우저 화면에 보여주기(jsp파일에 입력 시 명칭 allproduct)
        model.addAttribute("allproduct", list);

        // center에 shop 페이지 표출
        model.addAttribute("center", dir + "center");
        //model.addAttribute("header",dir +"header");
        return "index";
    }

    // 2- 이어링 상품 전체보기 : 127.0.0.1/shop/earring
    @RequestMapping("/earring")
    public String earring(Model model) throws Exception {
        // selecterg 사용
        List<Product> list = null;
        try {
            list = productService.selecterg();
        } catch (Exception e) {
            throw new Exception("/shop/earring 상품 전체조회 중 오류가 발생했습니다.");
        }
        // list에 담은 earring Product를 브라우저 화면에 보여주기(jsp파일에 입력 시 명칭)
        model.addAttribute("allearring", list);
        // center에 shop 페이지 표출
        model.addAttribute("center", dir + "earring");
        return "index";
    }
    // 3- 반지 상품 전체보기 : 127.0.0.1/shop/ring
    @RequestMapping("/ring")
    public String ring(Model model) throws Exception {
        List<Product> list = null;
        try {
            list = productService.selectring();
        } catch (Exception e) {
            throw new Exception("/shop/ring 상품 전체조회 중 오류가 발생했습니다.");
        }
        // list에 담은 ring Product를 브라우저 화면에 보여주기(jsp파일에 입력 시 명칭)
        model.addAttribute("allring", list);
        // center에 shop 페이지 표출
        model.addAttribute("center", dir + "ring");
        return "index";
    }
    // 4- 시계 상품 전체보기 : 127.0.0.1/shop/watch
    @RequestMapping("/watch")
    public String watch(Model model) throws Exception {
        List<Product> list = null;
        try {
            list = productService.selectwch();
        } catch (Exception e) {
            throw new Exception("/shop/watch 상품 전체조회 중 오류가 발생했습니다.");
        }
        // list에 담은 earring Product를 브라우저 화면에 보여주기(jsp파일에 입력 시 명칭)
        model.addAttribute("allwatch", list);
        // center에 shop 페이지 표출
        model.addAttribute("center", dir + "watch");
        return "index";
    }
    // 5- 목걸이 상품 전체보기 : 127.0.0.1/shop/necklace
    @RequestMapping("/necklace")
    public String necklace(Model model) throws Exception {
        List<Product> list = null;
        try {
            list = productService.selectnecklace();
        } catch (Exception e) {
            throw new Exception("/shop/necklace 상품 전체조회 중 오류가 발생했습니다.");
        }
        // list에 담은 earring Product를 브라우저 화면에 보여주기(jsp파일에 입력 시 명칭)
        model.addAttribute("allnecklace", list);
        // center에 shop 페이지 표출
        model.addAttribute("center", dir + "necklace");
        return "index";
    }
    // 6- 팔찌 상품 전체보기 : 127.0.0.1/shop/necklace
    @RequestMapping("/bracelet")
    public String bracelet(Model model) throws Exception {
        List<Product> list = null;
        try {
            list = productService.selectbracelet();
        } catch (Exception e) {
            throw new Exception("/shop/bracelet 상품 전체조회 중 오류가 발생했습니다.");
        }
        // list에 담은 earring Product를 브라우저 화면에 보여주기(jsp파일에 입력 시 명칭)
        model.addAttribute("allbracelet", list);
        // center에 shop 페이지 표출
        model.addAttribute("center", dir + "bracelet");
        return "index";
    }
    // 7- 모던 상품 전체보기 : 127.0.0.1/shop/modern
    @RequestMapping("/modern")
    public String modern(Model model) throws Exception {
        List<Product> list = null;
        try {
            list = productService.selectmodern();
        } catch (Exception e) {
            throw new Exception("/shop/modern 상품 전체조회 중 오류가 발생했습니다.");
        }
        // list에 담은 earring Product를 브라우저 화면에 보여주기(jsp파일에 입력 시 명칭)
        model.addAttribute("allmodern", list);
        // center에 shop 페이지 표출
        model.addAttribute("center", dir + "modern");
        return "index";
    }
    // 카테고리별 조회하기 : 127.0.0.1/shop/gift
    @RequestMapping("/gift")
    public String gift(Model model) throws Exception {
        List<Product> list = null;
        try {
            list = productService.selectgift();
        } catch (Exception e) {
            throw new Exception("/shop/gift 상품 전체조회 중 오류가 발생했습니다.");
        }
        model.addAttribute("allgift", list);
        model.addAttribute("center", dir + "gift");
        return "index";
    }
    // 카테고리별 조회하기 : 127.0.0.1/shop/casual
    @RequestMapping("/casual")
    public String casual(Model model) throws Exception {
        List<Product> list = null;
        try {
            list = productService.selectcasual();
        } catch (Exception e) {
            throw new Exception("/shop/casual 상품 전체조회 중 오류가 발생했습니다.");
        }
        model.addAttribute("allcasual", list);
        model.addAttribute("center", dir + "casual");
        return "index";
    }
    // 카테고리별 조회하기 : 127.0.0.1/shop/wedding
    @RequestMapping("/wedding")
    public String wedding(Model model) throws Exception {
        List<Product> list = null;
        try {
            list = productService.selectwedding();
        } catch (Exception e) {
            throw new Exception("/shop/wedding 상품 전체조회 중 오류가 발생했습니다.");
        }
        model.addAttribute("allwedding", list);
        model.addAttribute("center", dir + "wedding");
        return "index";
    }
    // 각 상품의 상세내용 조회 : 127.0.0.1/shop/detail?product_id=
    @RequestMapping("/detail")
    public String detail(Model model, int product_id) throws Exception {
        Productdetail productdetail = null;
        List<Product> list = null;
        try {
            productdetail = productdetailService.getselectdetail(product_id);

            list = productService.get();
        } catch (Exception e) {
            throw new Exception("상품 세부내용 조회 중 오류가 발생했습니다.");
        }
        model.addAttribute("detail", productdetail);
        // list에 담은 Product를 상세보기 화면 맨 아래에 보여주기(jsp파일에 입력 시 명칭 allproduct)
        model.addAttribute("allproduct", list);
        model.addAttribute("center", dir + "detail");
        return "index";
    }
    @RequestMapping("/confirmation")
    public String confirmation(Model model) throws Exception {
        // center에 shop 페이지 표출
        model.addAttribute("center",   "confirmation");
        return "index";
    }

    @RequestMapping("/order")
    public String order(Model model, String user_id, Cart cart) throws Exception {
        // center에 order 페이지 표출
        List<Cart> list = null; // 카트 정보 불러올 바구니 준비.
        try {
            list = cartService.getmycart( user_id ); // 카트 정보를 list에 담기.
        } catch (Exception e) {
            throw new Exception(e);
        }
        model.addAttribute("mycart", list);
        model.addAttribute("center",  dir + "order");
        return "index";
    }

}
