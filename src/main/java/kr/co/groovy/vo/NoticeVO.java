package kr.co.groovy.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class NoticeVO {
    private String notiEtprCode;
    private String notiTitle;
    private String notiContent;
    private Date notiDate;
    private int notiRdcnt;
    private String notiCtgryIconFileStreNm;
    private String commonCodeNotiKind;
    // 중요(별) 행사(깃발):생일 공지(확성기) 부고:봉투
    // 중요 순으로 셀렉트
    //


}
