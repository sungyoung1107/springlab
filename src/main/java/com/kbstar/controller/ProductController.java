package com.kbstar.controller;

import com.kbstar.dto.Product;
import com.kbstar.dto.ProductSearch;
import com.kbstar.service.ProductService;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductService productService;

    String dir = "product/";

    @Value("${uploadimgdir}")  // application properties 안에서 설정해준 imgdir 경로를 가져옴
    String imgdir;

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, Product product) throws Exception {
        MultipartFile mf = product.getImg();
        String imgname = mf.getOriginalFilename();
        log.info("----------------------------------------");
        log.info(imgname);
        log.info("----------------------------------------");
        product.setProduct_imgname(imgname);
        productService.register(product);
        FileUploadUtil.saveFile(mf,imgdir);
        return "redirect:/product/all";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Product> list = null;
        list = productService.get();
        model.addAttribute("clist", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model,@RequestParam("id") int id) throws Exception {
        Product product = null;
        product = productService.get(id);
        model.addAttribute("gitem", product);
        model.addAttribute("center", dir+"detail");
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Product product) throws Exception {
        MultipartFile mf = product.getImg();
        String new_imgname = mf.getOriginalFilename();
        if(new_imgname.equals("") || new_imgname == null){
            productService.modify(product);
        }else{
            product.setProduct_imgname(new_imgname);
            productService.modify(product);
            FileUploadUtil.saveFile(mf,imgdir);
        }
        return "redirect:/product/detail?id="+product.getProduct_id();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, int id) throws Exception {
        productService.remove(id);
        return "redirect:/product/all";
    }

    @RequestMapping("/search")
    public String search(Model model, ProductSearch ms) throws Exception {
        List<Product> list = null;
        list = productService.search(ms);

        model.addAttribute("ms", ms);
        model.addAttribute("clist", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }





}