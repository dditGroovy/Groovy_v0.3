package kr.co.groovy.security;

import kr.co.groovy.employee.EmployeeMapper;
import kr.co.groovy.vo.ConnectionLogVO;
import kr.co.groovy.vo.EmployeeVO;
import kr.co.groovy.vo.NotificationVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;

@Slf4j
@Service
public class CustomUserDetailsService implements UserDetailsService {
    private final EmployeeMapper mapper;
    InetAddress ip;

    public CustomUserDetailsService(EmployeeMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        EmployeeVO employeeVO = this.mapper.signIn(id);
        NotificationVO notificationVO = mapper.getNoticeAt(id);
        if (notificationVO != null) {
            employeeVO.setNotificationVO(notificationVO);
        }
//        ConnectionLogVO connectionLogVO = new ConnectionLogVO();
//        try {
//            connectionLogVO.setEmplId(id);
//            ip = InetAddress.getLocalHost();
//            connectionLogVO.setConectLogIp(ip.getHostAddress());
//            NetworkInterface network = NetworkInterface.getByInetAddress(ip);
//            byte[] mac = network.getHardwareAddress();
//            String macAddress = "";
//            for (int i = 0; i < mac.length; i++) {
//                macAddress += (String.format("%02x", mac[i]) + ":");
//            }
//            connectionLogVO.setConectLogMacadrs(macAddress);
//        } catch (UnknownHostException | SocketException e) {
//            throw new RuntimeException(e);
//        }
//
//        mapper.inputConectLog(connectionLogVO);
//        log.info(connectionLogVO +"");
        return employeeVO == null ? null : new CustomUser(employeeVO);
    }
}
