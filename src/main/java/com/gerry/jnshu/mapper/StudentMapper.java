package com.gerry.jnshu.mapper;

import com.gerry.jnshu.pojo.Student;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentMapper {

    Student queryInfoById(long id);
    List<Student> getStudentList();
    int addStudent(Student student);
    int updateSloganById(Integer id, String slogan);
    int deleteStudentById(Integer id);
}