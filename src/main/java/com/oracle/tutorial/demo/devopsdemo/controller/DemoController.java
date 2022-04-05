package com.oracle.tutorial.demo.devopsdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DemoController {

    @GetMapping("/")
    public String index(Model model){
        model.addAttribute("demo","Welcome to OCI DevOps Tutorial");
        return "index";
    }
    
}
