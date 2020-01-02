package com.gerry.jnshu.service;

import com.gerry.jnshu.mapper.ExcellentStudentMapper;
import com.gerry.jnshu.mapper.ProfessionMapper;
import com.gerry.jnshu.pojo.ExcellentStudent;
import com.gerry.jnshu.pojo.Profession;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.provider.ExampleProvider;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ExcellentStudentServiceImpl implements ExcellentStudentService {

    @Resource
    private ExcellentStudentMapper excellentStudentMapper;

    @Resource
    private ProfessionMapper professionMapper;

    @Override
    public List<ExcellentStudent> getExcellentStuInfos() {
        return excellentStudentMapper.selectAll();
    }

    @Override
    public List<Profession> getProInfos(String type) {
        Profession profession = new Profession();
        profession.setDevDirection(type);
        return professionMapper.select(profession);
    }

    @Override
    public List<String> getProTypes() {

        return professionMapper.queryProTypes();
    }
}
