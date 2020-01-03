<%@ taglib uri="http://localhost:8080/mytag/core" prefix="myTag" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<body>
<h2>Hello World!</h2>
<myTag:hello value="${requestScope.time}"/>
</body>
</html>
