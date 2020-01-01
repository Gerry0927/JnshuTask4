package com.gerry.jnshu.controller;


import com.gerry.jnshu.pojo.Student;
import com.gerry.jnshu.service.StudentService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@RequestMapping("student")
@Controller
public class StudentController {

    @Resource
    private StudentService studentService;
    @RequestMapping("/list")
    public String list(@RequestParam(required = false,defaultValue = "1") Integer pageNum,@RequestParam(required = false,defaultValue = "10") Integer pageSize,HashMap<String,Object> map){
        PageInfo<Student> ps = studentService.getStudentList(pageNum,pageSize);
        map.put("stuInfos",ps.getList());
        return "list";
    }
}
