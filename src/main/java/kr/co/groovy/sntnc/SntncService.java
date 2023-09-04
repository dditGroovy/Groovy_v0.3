package kr.co.groovy.sntnc;

import kr.co.groovy.vo.SntncVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class SntncService {
    final SntncMapper mapper;

    public SntncService(SntncMapper mapper) {this.mapper = mapper;}
    public void inputPost(SntncVO vo){mapper.inputPost(vo);}
}
