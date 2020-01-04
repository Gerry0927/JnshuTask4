package com.gerry.jnshu.controller;

import com.gerry.jnshu.pojo.ResultInfo;
import com.gerry.jnshu.pojo.Student;
import com.gerry.jnshu.service.StudentService;
import com.gerry.jnshu.utils.CookieUtils;
import com.gerry.jnshu.utils.DesUtils;
import com.gerry.jnshu.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Map;

@RequestMapping("admin")
@Controller
public class AdminController {

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public ResultInfo<Student> doLogin(String mobile, String password, Map<String, Object> map, HttpServletResponse response) throws Exception {
        ResultInfo<Student> resultInfo = new ResultInfo<Student>();
        if (mobile.equals("zhou") && MD5Utils.getMD5WithSalt(password).equals(MD5Utils.getMD5WithSalt("123"))) {
            Student student = studentService.queryStudentInfoById(10);
            if (student != null) {
                map.put("student", student);
                Date timeDate = new Date();
                map.put("time", timeDate);
                resultInfo.setMessage("登录成功");
                resultInfo.setCode(ResultInfo.OK);
                String token = DesUtils.encode(student.getId() + "," + timeDate.getTime());
                CookieUtils.setCookie(response, "token", token, 5 * 60);
            }

        } else {
            resultInfo.setMessage("用户名或密码错误");
            resultInfo.setCode(ResultInfo.ERROR);
        }
        return resultInfo;

    }

}
