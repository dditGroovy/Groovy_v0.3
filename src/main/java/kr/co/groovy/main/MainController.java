package kr.co.groovy.main;

import kr.co.groovy.vo.DietVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@RequestMapping("/main")
@Controller
public class MainController {
    final
    MainService service;

    public MainController(MainService service) {
        this.service = service;
    }
    @ResponseBody
    @GetMapping(value = "/{today}")
    public DietVO loadMenu(@PathVariable String today) {
        return service.loadDiet(today);
    }

    @GetMapping("/home")
    public String comebackHome(){
        return "main/home";
    }
}
