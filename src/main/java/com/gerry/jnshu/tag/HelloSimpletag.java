package com.gerry.jnshu.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HelloSimpletag extends SimpleTagSupport {
    //    private PageContext pageContext;
    private String value;
//    private String count;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

//    public String getCount() {
//        return count;
//    }
//
//    public void setCount(String count) {
//        this.count = count;
//    }
    //标签体逻辑实际应该编写到该方法中。

    public void doTag() throws JspException, IOException {
        System.out.println("doTag");
        PageContext pageContext = (PageContext) getJspContext();
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();


        JspWriter out = pageContext.getOut();
//        int c = 0;
//        c = Integer.parseInt(count);
//        for (int i = 0; i < c; i++) {
//            out.print(value + i);
//            out.print("<br>");
//        }
        try {
            long timeValue = Long.parseLong(request.getParameter("time"));
            System.out.println(timeValue);
//            Calendar calendar = Calendar.getInstance();
//            calendar.setTimeInMillis(timeValue);
//            Date timeDate = calendar.getTime();
            System.out.println(System.currentTimeMillis());
            Date timeDate = new Date(timeValue);
            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String str = sdf.format(timeDate);
            System.out.println(str);
            out.print("Hello:" + str);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

    }

}
