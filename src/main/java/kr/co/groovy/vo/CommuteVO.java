package kr.co.groovy.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;


@Getter
@Setter
@ToString
public class CommuteVO {
    private Date dclzWorkDe;
    private String dclzEmplId;
    private Date dclzAttendTm;
    private Date dclzLvffcTm;
    private int dclzDailWorkTime;
    private int dclzWikWorkTime;
    private String commonCodeLaborSttus;
}
