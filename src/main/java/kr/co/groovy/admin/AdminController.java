package kr.co.groovy.admin;

import kr.co.groovy.common.CommonService;
import kr.co.groovy.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
@Slf4j
@RequestMapping("/admin")
@Controller
public class AdminController {
    final
    AdminService service;
    final
    CommonService commonService;

    public AdminController(AdminService service, CommonService commonService) {
        this.service = service;
        this.commonService = commonService;
    }

    @GetMapping("/manageNotice")
    public ModelAndView manageNotice(ModelAndView mav) {
        List<NoticeVO> list = commonService.loadNoticeListForAdmin();
        mav.addObject("notiList", list);
        mav.setViewName("admin/manageNotice");
        return mav;

    }
    @PostMapping("/inputNotice")
    public String inputNotice(NoticeVO vo, MultipartFile[] notiFiles){
        service.inputNotice(vo, notiFiles);
        return "redirect:/admin/manageNotice";
    }
}
