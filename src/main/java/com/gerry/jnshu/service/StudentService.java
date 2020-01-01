package com.gerry.jnshu.service;


import com.gerry.jnshu.pojo.Student;
import com.github.pagehelper.PageInfo;

public interface StudentService {
    PageInfo<Student> getStudentList(int pageNum, int pageSize);
    int addStudent(Student student);
    int updateSloganById(Integer id, String slogan);
    int deleteStudentById(Integer id);
}
