package kr.co.groovy.sntnc;

import kr.co.groovy.vo.SntncVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;


@RequestMapping("/employee")
@Slf4j
@Controller
public class SntncController {
    final SntncService service;

    public SntncController(SntncService service) {this.service = service;}

    @PostMapping("/inputPost")
    public String postWritePro(String sntncCn, Principal principal, MultipartFile postFile) throws IOException {
        String sntncWritingEmplId = principal.getName();
        SntncVO vo = new SntncVO();
        vo.setSntncWritingEmplId(sntncWritingEmplId);
        service.inputPost(vo, postFile);
        return "redirect:/employee/teamCommunity";
    }

}
