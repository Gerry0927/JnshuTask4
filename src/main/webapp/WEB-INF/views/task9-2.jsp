<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>task9-3</title>
    <link type="text/css" rel="stylesheet" href="../../css/task9-3.css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="title">首页&gt<span>职业</span></div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="section1">
                <span class="total">方向&#58</span>
                <span class="branch">全部</span>
                <c:forEach items="${requestScope.proTypes}" var="pro" varStatus="id">
                <span class="branch">${pro}</span>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<c:if test="${!empty requestScope.proTypes}">
    <c:forEach items="${requestScope.proTypes}" var="pro" varStatus="id">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="subtitle">${pro}</div>

                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
             <c:forEach items="${requestScope.proInfos[pro]}" var="childPro">
                <div class="col-md-4 col-sm-6">
                    <div class="block">
                        <div class="row1">
                            <div>
                                <img src="../../img/${childPro.img}">
                            </div>
                            <div>
                                <p><span>${childPro.professionName}</span></p>
                                <p>${childPro.description}</p>
                            </div>
                        </div>
                        <div class="row2">
                            <p class="right-border">门槛<img src="../../img/19.jpg"></p>
                            <p>难易程度<img src="../../img/19.jpg"><img src="../../img/19.jpg"></p>
                        </div>
                        <div class="row3">
                            <p class="right-border">成长周期 <span>${childPro.periodJunior}-${childPro.periodSenior}年</span></p>
                            <p>稀缺程度 <span>${childPro.needCount}</span>家公司需要</p>
                        </div>
                        <div class="row4">
                            <div class="left">薪资待遇</div>
                            <div class="right">
                                <div>
                                    <span class="left-side">0-1年</span>
                                    <span class="right-side"><fmt:formatNumber value="${childPro.salaryJunior/1000}" maxFractionDigits="0"/>-<fmt:formatNumber value="${childPro.salarySenior/1000}" maxFractionDigits="0"/>K/月</span>
                                </div>
                                <div>
                                    <span class="left-side">1-3年</span>
                                    <span class="right-side"><fmt:formatNumber value="${childPro.salarySenior/1000}" maxFractionDigits="0"/>-<fmt:formatNumber value="${childPro.salaryProfess/1000}" maxFractionDigits="0"/>K/月</span>
                                </div>
                                <div>
                                    <span class="left-side">3-5年</span>
                                    <span class="right-side"><fmt:formatNumber value="${childPro.salaryProfess/1000}" maxFractionDigits="0"/>-40k/月</span>
                                </div>
                            </div>
                        </div>
                        <div class="row5">有<span>286</span>人正在学</div>
                        <div class="row6">提示：在你学习之前你应该已经掌握 PS，域名，Html，Html5，CSS，CSS3 等基础</div>
                        <div class="extro-info3">
                            <p class="extro-top"> ${childPro.professionName}</p>
                            <p class="extro-bottom">
                                    ${childPro.description}</p>
                        </div>
                    </div>
                </div>
             </c:forEach>
            </div>

        </div>
    </c:forEach>
</c:if>
</body>
</html>