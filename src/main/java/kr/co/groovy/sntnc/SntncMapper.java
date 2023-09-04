package kr.co.groovy.sntnc;

import kr.co.groovy.vo.SntncVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface SntncMapper {
    void inputPost(SntncVO vo);

    void uploadPostFile(Map<String, Object> map);
}