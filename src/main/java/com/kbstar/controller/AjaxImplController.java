package com.kbstar.controller;


import com.kbstar.dto.Cart;
import com.kbstar.dto.User;
import com.kbstar.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.InternalResourceView;

import javax.servlet.http.HttpSession;
import java.util.List;


@RestController // ajax에서 요청이 들어오면 그 요청을 받고 전달하는 곳! @RestController
public class AjaxImplController {
    @Autowired
    CartService cartService;
    //String dir = "shop/";
    @Value("${uploadimgdir}") // 이미지 즉시 저장경로
    String imgdir;

    @RequestMapping("/cart-items")
    public InternalResourceView getCartItems(Model model, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("loginuser");
        List<Cart> cartlist = cartService.getmycart(user.getUser_id());
        model.addAttribute("allcartlist", cartlist);
        return new InternalResourceView("header"); // cart-items.jsp 또는 해당하는 JSP 파일명
    }


}
