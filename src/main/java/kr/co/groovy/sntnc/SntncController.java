package kr.co.groovy.sntnc;

import kr.co.groovy.vo.SntncVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;


@RequestMapping("/employee")
@Slf4j
@Controller
public class SntncController {
    final SntncService service;

    public SntncController(SntncService service) {this.service = service;}

    /*@PostMapping("/inputPost")
    public String inputPost(@RequestBody SntncVO vo){
        *//*String sntncWritingEmplId = principal.getName();*//*
        service.inputPost(vo);
        return "redirect:/employee/teamCommunity";
    }*/
    @PostMapping("/inputPost")
    public String postWritePro(String sntncCn, Principal principal){
        String sntncWritingEmplId = principal.getName();
        System.out.println("sntncCn : " + sntncCn);
        System.out.println("sntncWritingEmplId : " + sntncWritingEmplId);

        SntncVO vo = new SntncVO();
        service.inputPost(vo);
        return "redirect:/employee/teamCommunity";
    }

}
