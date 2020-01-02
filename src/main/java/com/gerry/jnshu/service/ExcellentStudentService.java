package com.gerry.jnshu.service;

import com.gerry.jnshu.pojo.ExcellentStudent;
import com.gerry.jnshu.pojo.Profession;

import java.util.List;

public interface ExcellentStudentService {

    List<ExcellentStudent> getExcellentStuInfos();

    List<Profession> getProInfos(String type);

    List<String> getProTypes();
}
