package com.example.demo.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.dto.ProductDetailDto;
import com.example.demo.service.ProductService;

@Controller
public class WebController {

	@Autowired
    private ProductService productService;

    @GetMapping("/homepage") // Đường dẫn bạn sẽ gõ trên trình duyệt
    public String getHomePage() {
        return "homepage"; // Tên file HTML (không có đuôi .html)
    }

    @GetMapping("/products/{slug}")
    public String getProductBySlug(@PathVariable("slug") String slug, Model model) {
        // Gọi hàm mới trả về Optional<ProductDetailDto>
        Optional<ProductDetailDto> productDtoOpt = productService.getProductDetailBySlug(slug);

        if (productDtoOpt.isEmpty()) {
            return "404"; 
        }

        // Đưa DTO đã có đầy đủ masterFiles vào Model
        model.addAttribute("product", productDtoOpt.get());
        return "product-detail";
    }

    @GetMapping("/success")
    public String getSuccess() {
    	return "success";
    }

    @GetMapping("/cart")
    public String getCart() {
    	return "cart";
    }

    @GetMapping("/collections")
    public String getCollections() {
    	return "collections";
    }
}

