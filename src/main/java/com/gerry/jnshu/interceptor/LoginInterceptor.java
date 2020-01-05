package com.gerry.jnshu.interceptor;

import com.gerry.jnshu.pojo.Student;
import com.gerry.jnshu.service.StudentService;
import com.gerry.jnshu.utils.CookieUtils;
import com.gerry.jnshu.utils.DesUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    StudentService studentService;

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String url = httpServletRequest.getRequestURI();
        if (url.contains("/student/u")) {
            if (httpServletRequest.getSession().getAttribute("student") != null) {
                return true;
            } else {
//                request.getRequestDispatcher("/login.jsp").forward(servletRequest,servletResponse);
                //进行自动登录
                String cookie = CookieUtils.getCookie(httpServletRequest, "token");
                if (cookie != null) {
                    String token = DesUtils.decode(cookie);
                    long id = Long.parseLong(token.split(",")[0]);
                    Student student = studentService.queryStudentInfoById(id);
                    httpServletRequest.getSession().setAttribute("student", student);
                    System.out.println(student);
                    return true;
                } else {
                    httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login.jsp");
                    return false;
                }

            }
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }




}