package kr.co.groovy.admin;

import kr.co.groovy.vo.NoticeVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@Mapper
public interface AdminMapper {

    void inputNotice(NoticeVO vo);

    int getNotiSeq();

    void uploadNoticeFile(Map<String, Object> map);
}
