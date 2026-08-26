package com.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello from Spring Boot running on EKS!";
    }

    @GetMapping("/health")
    public String health() {
        return "UP";
    }
}