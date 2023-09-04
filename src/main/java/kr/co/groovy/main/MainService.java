package kr.co.groovy.main;

import kr.co.groovy.vo.DietVO;
import org.springframework.stereotype.Service;

@Service
public class MainService {
    final
    MainMapper mapper;

    public MainService(MainMapper mapper) {
        this.mapper = mapper;
    }

    public DietVO loadDiet(String today) {
        return mapper.loadMenu(today);
    }
}
