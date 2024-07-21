<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: dameng
  Date: 2024/7/8
  Time: 下午7:02
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://kit.fontawesome.com/73abbe098b.js" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    <link rel="stylesheet" href="font_cqbiizu5og9/iconfont.css">--%>
    <style>
        * {

            padding: 0;
            margin: 0;
            text-decoration: none;
        }

        body {
            background-color: rgb(209, 213, 219);
            background-image: url("../elements/zhuye.jpg");
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: flex-start;
            height: 100vh;
            align-items:start
        }

        .shell {
            width: 100px;
            height: 800px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            background-color: rgb(59, 59, 59);
            border-radius: 10px;
            transition: .3s;
            overflow: hidden;
        }

        .box {
            display: block;
            height: 15%;
            width: 85%;
            margin: 9px;
            border-radius: 5px;
            position: relative;
            transition: .3s;

        //导航栏颜色
        background-color: rgb(59, 59, 59);
            color: #ffffff;
        }
        .box i {
            font-size: 60px;
            position: absolute;
            margin: 7px 0 0 13px;
        }

        .box:nth-child(1)::before,
        .box:nth-child(5)::before{
            content: '';
            display: block;
            width: 100%;
            height: 2px;
            background-color: rgb(55, 65, 81);
            position: absolute;
            bottom: -10px;
        }

        .box span{
            position: relative;
            top: 22px;
            left: 80px;
            font: 500 20px '';
            opacity: 0;
            transition: .1s;
        }
        .shell:hover{
            width: 270px;
        }
        .box:hover{
            background-color: rgb(55, 65, 81);
        }
        .shell:hover span{
            opacity: 1;
        }
        .box:hover{
            color: #fff;
        }

        .shell:nth-child(2) {
            background-color: rgb(243, 244, 246);
        }
        .shell:nth-child(2) .box:hover{
            background-color: rgb(209, 213, 219);
            color: rgb(241, 159, 159);
        }
        .shell:nth-child(2) .box{
            color: #000;
        }

        .shell:nth-child(3) {
            background-color: rgb(49,46,129);
        }
        .shell:nth-child(3) .box:hover{
            background-color: rgb(67, 56, 202);
        }
        .shell:nth-child(3) .box{
            color: rgb(140, 120, 240);
        }

        /*滚动条*/
        .roll-box{
            height: 60px;
            /*border: 1px solid #ccc;*/
            /*border-radius: 6px;*/
            margin: 50px auto;
            width: 600px;
            position: relative;
            line-height: 40px;
            overflow: hidden;
            font-size: 40px;
        }
        .roll-box .text{
            position: absolute;
            white-space: nowrap;
            top: auto;
            left: auto;
            font-family: "Arial Black";
            color: #a0a5a8;
            animation-name: roll;
            animation-duration: 8s;
            animation-timing-function: linear;
            padding-right: 20px;
            animation-iteration-count: infinite;
        }
        .roll-box .text:before{
            content: '';
            display: inline-block;
            width: 200px;
            height: 100%;
        }
        @keyframes roll{
            from{
                transform: translate(100%,0);
            }
            to{
                transform: translate(-100%,0);
            }
        }

    </style>


</head>

<body>

<div class="shell">
    <a href="../AnnounceServlet?flag=1" class="box"><i class="fa-regular fa-calendar"></i><span>公告</span></a>
    <a href="../SelectById2Servlet?id=<%=session.getAttribute("id")%>&flag=0" class="box"><i class="fa-solid fa-user"></i><span> 个人信息</span></a>
    <a href="../SelectAllEmployeeServlet" class="box"><i class="fa-solid fa-user-group"></i><span>员工信息</span></a>
    <a href="../SelectAllAdminServlet" class="box"><i class="fa-solid fa-id-badge"></i><span>管理员信息</span></a>
    <a href="../SelectUndoServlet" class="box"><i class="fa-solid fa-plus"></i><span>个人待办</span></a>
    <a href="../SelectAllUndoServlet" class="box"><i class="fa-solid fa-plus"></i><span>全部待办</span></a>
    <%--    <a href="moreUndo.jsp" class="box"><i class="fa-solid fa-bars"></i></i><span>发布待办</span></a>--%>
    <a href="../login.jsp" class="box"><i class="fa-solid fa-user-slash"></i></i><span>退出</span></a>
    <%--  <a href="#" class="box"><i class="iconfont icon-dunpaibaoxianrenzheng"></i><span>authentication</span></a>--%>
</div>
<div class="roll-box">
    <div class="text">欢迎<%=session.getAttribute("name")%>登录</div>
</div>

</body>

</html>

