<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1.0,  maximum-scale=1">--%>
    <%--<link rel="stylesheet" type="text/css"--%>
    <%--href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <title>task9-1</title>
    <link type="text/css" rel="stylesheet" href="../../css/task9-1.css">

    <script type="text/javascript">
        /* 知识点：        */
        /*       this用法 */
        /*       DOM事件 */
        /*       定时器 */
        window.onload = function () {
            var container = document.getElementById('container');
            var list = document.getElementById('list');
            var buttons = document.getElementById('buttons').getElementsByTagName('span');
            var prev = document.getElementById('prev');
            var next = document.getElementById('next');
            var index = 1;
            var timer;

            function animate(offset) {
                //获取的是style.left，是相对左边获取距离，所以第一张图后style.left都为负值，
                //且style.left获取的是字符串，需要用parseInt()取整转化为数字。
                var newLeft = parseInt(list.style.left) + offset;
                list.style.left = newLeft + 'vw';
                //无限滚动判断
                if (newLeft > -100) {
                    list.style.left = -300 + 'vw';
                }
                if (newLeft < -300) {
                    list.style.left = -100 + 'vw';
                }
            }

            function play() {
                //重复执行的定时器
                timer = setInterval(function () {
                    next.onclick();
                }, 8000)
            }

            function stop() {
                clearInterval(timer);
            }

            function buttonsShow() {
                //将之前的小圆点的样式清除
                for (var i = 0; i < buttons.length; i++) {
                    if (buttons[i].className == "on") {
                        buttons[i].className = "";
                    }
                }
                //数组从0开始，故index需要-1
                buttons[index - 1].className = "on";
            }

            prev.onclick = function () {
                index -= 1;
                if (index < 1) {
                    index = 3
                }
                buttonsShow();
                animate(100);
            };
            next.onclick = function () {
                //由于上边定时器的作用，index会一直递增下去，我们只有5个小圆点，所以需要做出判断
                index += 1;
                if (index > 3) {
                    index = 1
                }
                animate(-100);
                buttonsShow();
            };
            for (var i = 0; i < buttons.length; i++) {
                (function (i) {
                    buttons[i].onclick = function () {
                        /*  这里获得鼠标移动到小圆点的位置，用this把index绑定到对象buttons[i]上，去谷歌this的用法  */
                        /*  由于这里的index是自定义属性，需要用到getAttribute()这个DOM2级方法，去获取自定义index的属性*/
                        var clickIndex = parseInt(this.getAttribute('index'));
                        var offset = 100 * (index - clickIndex); //这个index是当前图片停留时的index
                        animate(offset);
                        index = clickIndex; //存放鼠标点击后的位置，用于小圆点的正常显示
                        buttonsShow();
                    }
                })(i)
            }
            container.onmouseover = stop;
            container.onmouseout = play;
            play();
        }
    </script>


</head>
<body>
<div id="container">
    <div id="list" style="left: -100vw;">
        <img src="http://jns.img.bucket.ks3-cn-beijing.ksyun.com/skill/1/d4511b09-f892-49e0-b9d1-ed73a185ce2e.jpeg"
             alt="1"/>
        <img src="http://jns.img.bucket.ks3-cn-beijing.ksyun.com/skill/1/27386e39-3d1e-4b51-b9c9-b68e263831dd.jpg"
             alt="1"/>
        <img src="http://jns.img.bucket.ks3-cn-beijing.ksyun.com/skill/1/716b4d3b-5e13-4bdd-ae6f-99b90ab2bd66.png"
             alt="2"/>
        <img src="http://jns.img.bucket.ks3-cn-beijing.ksyun.com/skill/1/d4511b09-f892-49e0-b9d1-ed73a185ce2e.jpeg"
             alt="3"/>
        <img src="http://jns.img.bucket.ks3-cn-beijing.ksyun.com/skill/1/27386e39-3d1e-4b51-b9c9-b68e263831dd.jpg"
             alt="3"/>
    </div>
    <div id="buttons">
        <span index="1" class="on"></span>
        <span index="2"></span>
        <span index="3"></span>
    </div>
    <a href="javascript:;" id="prev" class="arrow">&lt;</a>
    <a href="javascript:;" id="next" class="arrow">&gt;</a>
</div>


<div class="section1">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-12 col-xs-12">
                <div class="box1">
                    <div class="row1"><img src="../../img/1.jpg"></div>
                    <p class="row2">高效</p>
                    <p class="row3">将五到七年的成长时间，缩短到一年到三年。</p>
                </div>
            </div>

            <div class="col-md-3 col-sm-12 col-xs-12">
                <div class="box1">
                    <div class="row1"><img src="../../img/2.jpg"></div>
                    <p class="row2">规范</p>
                    <p class="row3">标准的实践教程，不会走弯路。</p>
                </div>
            </div>

            <div class="col-md-3 col-sm-12 col-xs-12">
                <div class="box1">
                    <div class="row1"><img src="../../img/3.jpg"></div>
                    <p class="row2">人脉</p>
                    <p class="row3"></picture>同班好友，同院学长，技术大师，入学就混入职脉圈，为以后铺平道路</p>
                </div>
            </div>

            <div class="box col-md-3 col-sm-12 col-xs-12">
                <div class="number"><img src="../../img/4.jpg">1024</div>
                <p class="sum">累计在线学习人数</p>
                <div class="number"><img
                        src="../../img/4.jpg">1024
                </div>
                <p class="sum">学员已经找到满意工作</p>
            </div>
        </div>
    </div>
</div>

<div class="title">如何学习</div>


<div class="sention2">
    <div class="step">
        <div class="container">
            <div class="row">
                <div class="quarter col-md-3 col-sm-6 col-xs-12">
                    <div class="order">1</div>
                    <p>匹配你现在的个人情况寻找适合自己的岗位</p>
                    <div class="icon"><img src="../img/5.jpg"></div>
                </div>
                <div class="quarter col-md-3 col-sm-6 col-xs-12">
                    <div class="order">2</div>
                    <p>了解职业前景薪金待遇、竞争压力等</p>
                    <div class="icon"><img src="../img/5.jpg"></div>
                </div>
                <div class="quarter col-md-3 col-sm-6 col-xs-12">
                    <div class="order">3</div>
                    <p><span class="special special-1">掌握行业内顶级技能</span></p>
                    <div class="icon"><img src="../img/5.jpg"></div>
                </div>
                <div class="quarter col-md-3 col-sm-6 col-xs-12">
                    <div class="order">4</div>
                    <p><span class="special special-2">查看职业目标任务</span></p>
                    <div class="icon"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="step">
        <div class="container">
            <div class="row">
                <div class="quarter col-md-3 col-sm-6 col-xs-12">
                    <div class="order">5</div>
                    <p>参考学习资源、掌握技能点逐个完成任务</p>
                    <div class="icon"><img src="../img/5.jpg"></div>
                </div>
                <div class="quarter col-md-3 col-sm-6 col-xs-12">
                    <div class="order">6</div>
                    <p>加入班级，和小伙伴互帮互助，一块学习</p>
                    <div class="icon"><img src="../img/5.jpg"></div>
                </div>
                <div class="quarter col-md-3 col-sm-6 col-xs-12">
                    <div class="order">7</div>
                    <p>选择导师，一路引导，加速自己成长</p>
                    <div class="icon"><img src="../img/5.jpg"></div>
                </div>
                <div class="quarter col-md-3 col-sm-6 col-xs-12">
                    <div class="order">8</div>
                    <p>完成职业技能升级业界大牛</p>
                    <div class="icon"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="title">优秀学员展示</div>
<c:if test="${!empty requestScope.excellentStuInfos}">
    <div class="container">
        <div class="row">
            <c:forEach items="${requestScope.excellentStuInfos}" begin="0" end="3" var="stu">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="block">
                        <div class="char"><img src="../../img/${stu.imgurl}"></div>
                        <div class="adviser">${stu.title}：${stu.name}</div>
                        <div class="intro">${stu.description}</div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</c:if>
<c:if test="${empty requestScope.excellentStuInfos}">
    <div class="title">暂无信息</div>
</c:if>
<div class="title">战略合作企业</div>
<div class="container">
    <div class="row">
        <div class="picture col-md-2 col-sm-12 col-xs-12"><img src="../img/10.jpg"></div>
        <div class="picture col-md-2 col-sm-12 col-xs-12"><img src="../img/11.jpg"></div>
        <div class="picture col-md-2 col-sm-12 col-xs-12"><img src="../img/12.jpg"></div>
        <div class="picture col-md-2 col-sm-12 col-xs-12"><img src="../img/13.jpg"></div>
        <div class="picture col-md-2 col-sm-12 col-xs-12"><img src="../img/14.jpg"></div>
    </div>
</div>
<div class="subtitle">友情链接</div>

<div class="section5">
    <div class="container">
        <div class="row">
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">手机软件</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">教师招聘</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">找工作</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">教师招聘</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">找工作</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">手机软件</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">教师招聘</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">手机软件</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">手机软件</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">找工作</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">手机软件</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">教师招聘</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">找工作</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">教师招聘</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">找工作</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">手机软件</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">教师招聘</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">手机软件</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">手机软件</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
            <div class="link col-md-1 col-sm-2 col-xs-6">
                <ul>
                    <li>
                        <a href="#">找工作</a>
                        <div class="extro-info3"></div>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</div>
</div>
</body>
</html>