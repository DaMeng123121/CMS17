<%@ page import="java.util.ArrayList" %>
<%@ page import="com.task.vo.Announce" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/7/16
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0px;
            bottom: 0px;
            padding: 0px;
            list-style: none;
            text-decoration: none;
        }

        body {
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
            background-color: rgb(170, 190, 250);
        }

        .shell{
            width: 900px;
            height: 500px;
            position: relative;
            overflow-x: hidden;
            border-radius: 5px;
            border: 10px #fff solid;
            box-shadow: 20px 30px 20px rgba(0,0,0,.5);
        }
        .images{
            width: 300%;
            height: 100%;
            display: flex;
            position: absolute;
            left: 0;
            transition: .2s;
        }
        .img{
            position: relative; /* 使得伪元素定位相对于该元素 */
            list-style: none; /* 去除列表项的默认样式 */
            margin-bottom: 20px; /* 图片与公告之间的间距，根据需要调整 */
            width: 100%;
            background-size: cover;
        }
        .img::after {
            content: attr(data-text); /* 使用伪元素的 content 属性插入文本 */
            position: absolute; /* 绝对定位 */
            top: 20px; /* 距离顶部的距离 */
            left: 50%; /* 将左边距设置为页面宽度的一半 */
            transform: translateX(-50%); /* 使用transform属性将元素向左移动其自身宽度的一半，以实现居中效果 */
            text-align: center; /* 设置文字居中 */
            max-width: 700px; /* 最大宽度为800px */
            word-wrap: break-word; /* 允许单词内换行 */
            background-color: rgba(255, 255, 255, 0.7); /* 背景颜色 */
            padding: 10px; /* 内边距 */
            border-radius: 5px; /* 圆角 */
        }
        .img:nth-child(1){
            background-image: url("elements/announce1.jpg");
        }
        .img:nth-child(2){
            background-image: url("elements/announce2.jpg");
        }
        .img:nth-child(3){
            background-image: url("elements/announce3.jpg");
        }
        .min-images{
            display: flex;
            justify-content: space-evenly;
            position: absolute;
            bottom: 20px;
            width: 40%;
            z-index: 999;
            right: 10%;
        }
        .min{
            width: 60px;
            height: 60px;
            /* 鼠标悬浮时显示按钮指针 */
            cursor: pointer;
            border-radius: 50%;
            background-size: cover;
            border: solid 5px rgba(255,255,255,0.5);
            /* 照片偏移量 */
            background-position: -20px 0;
        }
        .min:nth-child(1){
            background-image: url("../elements/announce1.jpg");
        }
        .min:nth-child(2){
            background-image: url("../elements/announce2.jpg");
        }
        .min:nth-child(3){
            background-image: url("../elements/announce3.jpg");
        }
        .button{
            width: 100%;
            height: 100%;
            position: absolute;
            display: flex;
            justify-content: space-between;
            user-select: none;
        }
        .button-left,
        .button-right{
            font-size: 50px;
            background-color: rgba(160,190,255,0.7);
            padding: 0 20px;
            line-height: 500px;
            cursor: pointer;
        }
        .button-back {
            position: fixed; /* 让按钮固定在视口 */
            bottom: 40px; /* 距离底部的距离 */
            right: 40px; /* 距离右侧的距离 */
            font-size: 20px; /* 按钮字体大小 */
            background-color: rgba(12, 80, 225, 0.7); /* 蓝色背景，带透明度 */
            padding: 10px 15px; /* 内边距 */
            line-height: 1; /* 行高 */
            border:white; /* 去除边框 */
            color: white; /* 文字颜色为白色 */
            border-radius: 5px; /* 圆角 */
            z-index: 999; /* 确保按钮位于其他内容上方 */
        }
        .button-all-announce {
            position: fixed; /* 让按钮固定在视口 */
            bottom: 40px; /* 距离底部的距离 */
            right: 200px; /* 距离右侧的距离 */
            font-size: 20px; /* 按钮字体大小 */
            background-color: rgba(12, 80, 225, 0.7); /* 蓝色背景，带透明度 */
            padding: 10px 15px; /* 内边距 */
            line-height: 1; /* 行高 */
            border:white; /* 去除边框 */
            color: white; /* 文字颜色为白色 */
            border-radius: 5px; /* 圆角 */
            z-index: 999; /* 确保按钮位于其他内容上方 */
        }

    </style>
</head>

<body>
<%--公告传入--%>
<%
    ArrayList<Announce> announceList = (ArrayList<Announce>) request.getAttribute("announceList");
    request.setAttribute("announceList", announceList);
%>

<div class="shell">
    <ul class="images">
        <li class="img" data-text=<%=announceList.get(0).getContent()%>>></li>
        <li class="img" data-text=<%=announceList.get(1).getContent()%>>></li>
        <li class="img" data-text="<%=announceList.get(2).getContent()%>>"></li>
    </ul>
    <ul class="min-images">
        <li class="min"></li>
        <li class="min"></li>
        <li class="min"></li>
    </ul>
    <div class="button">
        <div class="button-left"><</div>
        <div class="button-right">></div>
    </div>
</div>

<div class="button">
    <%if (session.getAttribute("level").equals("employee")){%>
    <button class="button-all-announce" onclick="buttonAllAnnounce()">所有公告</button>
    <%}else {%>
    <button class="button-all-announce" onclick="buttonAllAnnounce2()">所有公告</button>
    <%}%>
    <button class="button-back" onclick="history.back()">返回主页</button>
</div>


</body>
<script>
    let left = document.querySelector('.button-left')
    let right = document.querySelector('.button-right')
    let min = document.querySelectorAll('.min')
    let images = document.querySelector('.images')

    let index = 0
    let time

    function position() {
        images.style.left = (index * -100) + "%"
    }
    function add(){
        if(index >= min.length-1){
            index = 0
        }else{
            index++
        }
    }
    function desc(){
        if(index <1){
            index = min.length-1
        }else{
            index--
        }
    }
    function timer(){
        time = setInterval(()=>{
            index++
            desc()
            add()
            position()
        },3000)
    }
    left.addEventListener('click',()=>{
        desc()
        position()
        clearInterval(time)
        timer()
    })
    right.addEventListener('click',()=>{
        add()
        position()
        clearInterval(time)
        timer()
    })
    for(let i = 0;i<min.length;i++){
        min[i].addEventListener('click',()=>{
            index = i
            position()
            clearInterval(time)
            timer()
        })
    }
    timer()
    function buttonAllAnnounce() {

        window.location.href="AnnounceServlet?flag=2";
    }
    function buttonAllAnnounce2() {

        window.location.href="AnnounceServlet?flag=3";
    }
</script>

</html>
