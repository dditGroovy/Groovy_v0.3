package kr.co.groovy.vehicle;

import kr.co.groovy.vo.VehicleVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.Date;
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
        List<VehicleVO> reservedVehicle = service.getReservedVehicle(vhcleNo);
        return reservedVehicle;
    }

    @GetMapping("/myReservedVehicles")
    @ResponseBody
    public List<VehicleVO> getReservedVehicleByEmplId(Principal vhcleResveEmplId) {
        List<VehicleVO> reservedVehicleByEmplId = service.getReservedVehicleByEmplId(vhcleResveEmplId.getName());
        return reservedVehicleByEmplId;
    }

    @PostMapping("/inputReservation")
    @ResponseBody
    public String inputReservation(Principal vhcleResveEmplId, @RequestBody VehicleVO vehicleVO) {
        log.info("vehicleVO" + vehicleVO);
        if (vehicleVO.getVhcleNo() == null || vehicleVO.getVhcleNo() == "") {
            return "vhcleNo is null";
        } else if (vehicleVO.getVhcleResveBeginTime() == null) {
            return "beginTime is null";
        } else if (vehicleVO.getVhcleResveEndTime() == null) {
            return "endTime is null";
        }

        if (vehicleVO.getVhcleResveBeginTime().equals(vehicleVO.getVhcleResveEndTime())) {
            return "same time";
        } else {
            vehicleVO.setVhcleResveEmplId(vhcleResveEmplId.getName());
            int count = service.inputReservation(vehicleVO);
            return String.valueOf(count);
        }
    }

}
