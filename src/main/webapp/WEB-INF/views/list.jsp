<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="panel-heading" align="right">
    <a href="${pageContext.request.contextPath}/student"><h5>新增学生信息</h5></a>
</div>
<div class="panel-body">
    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th width="10%" > ID</th>
            <th width="15%" > 姓名</th>
            <th width="15%" > QQ</th>
            <th width="15%" > 职业</th>
            <th width="10%" > 学号</th>
            <th width="30%" > 口号</th>
            <th width="20%" > 编辑</th>
            <th width="20%" > 删除</th>
        </tr>
        </thead>
        <c:if test="${empty requestScope.stuInfos}">
            <tr>
                <td colspan="4" align="center">暂无数据</td>
            </tr>
        </c:if>
        <c:if test="${!empty requestScope.stuInfos}">
            <c:forEach var="stu" items="${requestScope.stuInfos}">
                <tr>
                    <td >${stu.id}</td>
                    <td >${stu.name}</td>
                    <td >${stu.qq}</td>
                    <td >${stu.jnshuType}</td>
                    <td >${stu.onlineNum}</td>
                    <td >${stu.slogan}</td>
                    <td >
                        <form action="${pageContext.request.contextPath}/student/${stu.id}" method="get">
                            <input type="Submit" value="Edit"/>
                        </form>
                    </td>
                    <td >
                        <form action="${pageContext.request.contextPath}/student/${stu.id}" method="post">
                            <input type="hidden" value="DELETE" name="_method"/>
                            <input type="Submit" value="Delete"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
</div>
</body>
</html>




