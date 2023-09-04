package kr.co.groovy.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class EmployeeVO {
    private String emplId;
    private String emplPassword;
    private String emplNm;
    private String emplTelno;
    private String emplEmail;
    private String emplZip;
    private String emplAdres;
    private String emplDetailAdres;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date emplEncpn; // 입사일
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date emplBrthdy;
    private String enabled;
    private String commonCodeDept; // 부서구분
    private String commonCodeClsf; // 직급구분
    private String commonCodeHffcSttus;  // 재직상태 (0: 재직 1: 휴직 2: 퇴사)
    private String commonCodeLastAcdmcr; // 최종학력 (0: 고졸, 1: 학사, 2: 석사, 3: 박사)
    private String proflPhotoFileStreNm; // 프로필사진 (PROFL 테이블)
    private String signPhotoFileStreNm;  // 서명 (SIGN 테이블)
//    private String dutyRequest;
//    private String answer;
//    private String teamNotice;
//    private String companyNotice;
//    private String schedule;
//    private String newChattingRoom;
//    private String emailReception;
//    private String electronSanctionReception;
//    private String electronSanction;
    private List<EmployeeAuthVO> employeeAuthVOList;
//    private NotificationVO notificationVO;
}
