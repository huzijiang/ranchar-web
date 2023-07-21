package com.demo.rancher.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author huzj
 * @version 1.0
 * @date 2023/7/21 下午3:01
 */
@RestController
@RequestMapping("web")
public class WebTestController {

    @GetMapping("/wit")
    public String  webInterfaceTest(){
        return "success";
    }


}
