package kr.co.groovy.vehicle;

import kr.co.groovy.vo.VehicleVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface VehicleMapper {
    public List<VehicleVO> getVehicles();

    public List<VehicleVO> getReservedVehicle(String vhcleNo);
}
