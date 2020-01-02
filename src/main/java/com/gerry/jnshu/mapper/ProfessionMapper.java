package com.gerry.jnshu.mapper;

import com.gerry.jnshu.pojo.Profession;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ProfessionMapper extends Mapper<Profession> {

    List<Profession> queryProInfos();

    List<String> queryProTypes();
}