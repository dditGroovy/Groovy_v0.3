package kr.co.groovy.main;

import kr.co.groovy.vo.DietVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainMapper {
    DietVO loadMenu(String today);
}
