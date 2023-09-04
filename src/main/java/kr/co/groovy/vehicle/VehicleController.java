package kr.co.groovy.vehicle;

import kr.co.groovy.vo.VehicleVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/facility")
@RequiredArgsConstructor
public class VehicleController {
    private final VehicleService service;

    @GetMapping("/vehicle")
    public ModelAndView getVehicles(ModelAndView mav) {
        List<VehicleVO> vehicles = service.getVehicles();
        mav.addObject("vehicles", vehicles);
        mav.setViewName("facility/carResve");
        return mav;
    }

    @GetMapping("/reservedVehicles/{vhcleNo}")
    @ResponseBody
    public List<VehicleVO> getReservedVehicle(@PathVariable String vhcleNo) {
        log.info("vhcleNo: " + vhcleNo);
        List<VehicleVO> reservedVehicle = service.getReservedVehicle(vhcleNo);
        log.info("reservedVehicle: " + reservedVehicle);
        return reservedVehicle;
    }
}
