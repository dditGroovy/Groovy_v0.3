package kr.co.groovy.vehicle;

import kr.co.groovy.vo.VehicleVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface VehicleMapper {
    public List<VehicleVO> getVehicles();

    public List<VehicleVO> getReservedVehicleByVhcleNo(String vhcleNo);

    public List<VehicleVO> getReservedVehicleByEmplId(String vhcleResveEmplId);

    public int inputReservation(VehicleVO vehicleVO);

    public int deleteReservedByVhcleResveNo(int vhcleResveNo);
}
