package com.gerry.jnshu.pojo;

import com.github.pagehelper.PageInfo;

/**
 * Created by Zerry on 18/5/21.
 */
public class ResultInfo<T> {
    public static final Integer OK = 0;
    public static final Integer ERROR = -1;
    private Integer code;
    private String message;
    private String url;
    private T data;

//    private Exception exception;

    public ResultInfo(Integer code, String message, String url, T data) {
        this.code = code;
        this.message = message;
        this.url = url;
        this.data = data;
    }

    public ResultInfo() {
    }

    public ResultInfo(T data) {
        this.data = data;
    }

    public ResultInfo(String message) {

        this.message = message;
    }

    public ResultInfo(Integer code) {

        this.code = code;
    }

    public static Integer getOK() {
        return OK;
    }

    public static Integer getERROR() {
        return ERROR;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "ResultInfo{" +
                "code=" + code +
                ", message='" + message + '\'' +
                ", url='" + url + '\'' +
                ", data=" + data +
                '}';
    }
}
