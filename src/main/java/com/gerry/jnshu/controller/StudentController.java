package com.gerry.jnshu.controller;


import com.gerry.jnshu.pojo.ExcellentStudent;
import com.gerry.jnshu.pojo.Profession;
import com.gerry.jnshu.pojo.Student;
import com.gerry.jnshu.service.ExcellentStudentService;
import com.gerry.jnshu.service.StudentService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("student")
@Controller
public class StudentController {

    @Resource
    private StudentService studentService;

    @Resource
    private ExcellentStudentService excellentStudentService;

    @RequestMapping("/list")
    public String list(@RequestParam(required = false,defaultValue = "1") Integer pageNum,@RequestParam(required = false,defaultValue = "10") Integer pageSize,HashMap<String,Object> map){
        PageInfo<Student> ps = studentService.getStudentList(pageNum,pageSize);
        map.put("stuInfos",ps.getList());
        return "list";
    }

    @RequestMapping("/toTask2")
    public String toMainPage(Map<String, Object> map) throws Exception {

        List<String>  proTypes = excellentStudentService.getProTypes();
        map.put("proTypes", proTypes);

        Map<String,List<Profession>> proInfos = new HashMap<>();
        for (String type : proTypes) {
            proInfos.put(type,excellentStudentService.getProInfos(type));
        }
        map.put("proInfos", proInfos);
        return "views/task9-2";
    }
//
    @RequestMapping("/toTask1")
    public String toTask2(Map<String, Object> map) throws Exception {
        List<ExcellentStudent>  proInfos = excellentStudentService.getExcellentStuInfos();
        map.put("excellentStuInfos", proInfos);
        return "views/task9-1";
    }

//    @RequestMapping("/toTask3")
//    public String toTask3() throws Exception {
//        return "views/task9-3";
//    }
}
