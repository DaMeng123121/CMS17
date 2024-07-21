<%@ page import="java.util.List" %>
<%@ page import="com.task.vo.Announce" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有公告</title>
    <%--    <script src="https://cdn.jsdelivr.net/npm/bubbly-bg@0.2.3/dist/bubbly-bg.js"></script>--%>
    <style>
        /*body {*/
        /*    font-family: Arial, sans-serif;*/
        /*    background-color: #f2f2f2;*/
        /*    margin: 20px;*/
        /*}*/
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            align-items: center;
            /*justify-content: center;*/
            display: flex;
            height: 100vh;
        }

        span {
            line-height: 100vh;
            font-size: 50px;
            color: white;
        }

        .radial-gradient-demo {
            background-color: rgb(6, 80, 163);
            background-image: radial-gradient(closest-side, rgb(6, 80, 163), rgba(68, 178, 43, 0)), radial-gradient(closest-side, rgb(255, 255, 255), rgba(10, 201, 55, 0)), radial-gradient(closest-side, rgb(64, 145, 14), rgba(254, 234, 131, 0)), radial-gradient(closest-side, rgb(234, 135, 7), rgba(170, 142, 245, 0));
            background-size: 130vw 130vh, 120vw 120vh, 100vw 150vh, 120vw 130vh;
            background-position: -80vw -80vh, 30vw -20vh, -20vw 20vh, 30vw 20vh;
            background-repeat: no-repeat;
            animation: 10s moiveAnimation infinite;
        }

        @keyframes moiveAnimation {
            0%,
            100% {
                background-size: 130vw 130vh, 120vw 120vh, 100vw 150vh, 120vw 130vh;
                background-position: -80vw -80vh, 30vw -20vh, -20vw 20vh, 30vw 20vh;
            }
            25% {
                background-size: 120vw 120vh, 130vw 150vh, 130vw 120vh, 100vw 110vh;
                background-position: -30vw -30vh, 40vw -10vh, 0vw 10vh, -10vw 20vh;
            }
            50% {
                background-size: 130vw 130vh, 140vw 100vh, 100vw 150vh, 90vw 110vh;
                background-position: 10vw -60vh, 20vw 10vh, 10vw 30vh, 10vw -20vh;
            }
            75% {
                background-size: 140vw 140vh, 100vw 130vh, 100vw 150vh, 130vw 110vh;
                background-position: -70vw -70vh, 0vw -10vh, 30vw -20vh, 20vw 30vh;
            }
        }
        h1 {
            text-align: center;
            color: #333333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.4);
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            opacity: 70%;
        }
        table th, table td {
            padding: 10px;
            text-align: center;
            border: 1px solid rgba(221, 221, 221, 0.4);
        }
        table th {
            background-color: rgba(242, 242, 242, 0.4);
        }
        table tr:nth-child(even) {
            background-color: rgba(249, 249, 249, 0.4);
        }
        table tr:hover {
            background-color: rgba(241, 241, 241, 0.2);
        }
        .actions {
            text-align: center;
        }
        .actions a {
            margin: 0 5px;
            color: #333333;
            text-decoration: none;
        }
        .actions a:hover {
            color: #1e90ff;
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
            text-decoration: none;
        }

    </style>
</head>

<body class="radial-gradient-demo">
<%
    List<Announce> list = (List<Announce>) request.getAttribute("announceList");
%>

<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>公告内容</th>
        <th>发布时间</th>
        <th>发布者</th>
    </tr>
    </thead>
    <tbody>
    <% for (Announce announce : list) { %>
    <tr>
        <td><%= announce.getId() %></td>
        <td><%= announce.getContent() %></td>
        <td><%=announce.getTime()%></td>
        <td><%=announce.getPublisher()%></td>
    </tr>
    <% } %>
    </tbody>
</table>

<div class="button">
    <button><a href="employee/employeeIndex.jsp" class="button-back">返回主页</a></button>
</div>
</body>
</html>

