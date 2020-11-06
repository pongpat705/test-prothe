package org.maoz.prothemeus.br1.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class AppController {

    @GetMapping("/test")
    public Map<String, String> test(){

        Map<String, String> test = new HashMap<>();
        test.put("x1", "xxxxxxx");
        return test;
    }
}
