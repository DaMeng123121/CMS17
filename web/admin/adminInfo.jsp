<%@ page import="com.task.vo.Employee" %>
<%@ page import="com.task.vo.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-size: cover;
            background-position: center;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;

        }
        .container {
            width: 80%;
            background-color: rgba(255, 255, 255, 0.2); /* 调整背景颜色透明度 */
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 20px;
            border-radius: 8px;
            z-index: 999;
            text-align: center; /* 居中对齐 */
        }
        .input-field {
            margin-bottom: 10px;
        }
        .employee-details {
            margin-bottom: 20px;
            text-align: center; /* 调整文本左对齐 */
        }
        .employee-details table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            text-align: center;
        }
        .employee-details table th{
            padding: 10px;
            border: 1px solid #ddd; /* 边框颜色 */
            width: 100px; /* 你可以根据需要调整宽度 */

        }
        .employee-details table td {
            padding: 10px;
            border: 1px solid #ddd; /* 边框颜色 */
            width: 300px; /* 你可以根据需要调整宽度 */
        }
        .employee-details table th {
            background-color: rgba(242, 242, 242, 0.2); /* 表头背景色 */
        }
        .employee-details table tr:nth-child(even) {
            background-color: rgba(249, 249, 249, 0.2); /* 偶数行背景色 */
        }
        .employee-details table tr:hover {
            background-color: #f2f2f2; /* 鼠标悬停时背景色 */
        }
        .actions {
            text-align: center;
            margin-top: 10px;
        }
        .actions a {
            margin: 0 5px;
            color: #1e90ff; /* 蓝色按钮 */
            text-decoration: none;
            background-color: #f2f2f2; /* 按钮背景色 */
            padding: 10px 20px;
            border-radius: 5px;
            border: 1px solid #1e90ff; /* 蓝色边框 */
            transition: background-color 0.3s, color 0.3s;
            display: inline-block;
        }
        .actions a:hover {
            background-color: #1e90ff; /* 鼠标悬停时背景色 */
            color: white; /* 鼠标悬停时字体颜色 */
        }
        .actions button {
            margin-left: 10px;
            padding: 10px 20px;
            background-color: #f2f2f2; /* 按钮背景色 */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
            z-index: 2;        }
        .actions button:hover {
            background-color: #1e90ff; /* 鼠标悬停时背景色 */
            color: white; /* 鼠标悬停时字体颜色 */
            z-index: 2;
        }

    </style>


</head>

<body>

<script src="change.js" type="text/javascript"></script>

<%
    Admin admin = (Admin) request.getAttribute("admininfo");
%>
<div class="container">
    <div class="employee-details">
        <h1>职员信息</h1>
        <table>
            <tr >
                <th>工号</th>
                <td><%= admin.getId() %></td>
            </tr>
            <tr>
                <th>姓名</th>
                <td><%= admin.getName() %></td>
            </tr>
            <tr>
                <th>年龄</th>
                <td><%= admin.getAge() %></td>
            </tr>
            <tr>
                <th>性别</th>
                <td><%= admin.getSex() %></td>
            </tr>
            <tr>
                <th>密码</th>
                <td><%= admin.getPassword() %></td>
            </tr>
            <tr>
                <th>电话</th>
                <td><%= admin.getTel() %></td>
            </tr>
            <tr>
                <th>邮箱</th>
                <td><%= admin.getEmail() %></td>
            </tr>
            <tr>
                <th>家庭住址</th>
                <td><%= admin.getAddress() %></td>
            </tr>
            <tr>
                <th>所属部门</th>
                <td><%= admin.getDept() %></td>
            </tr>
            <tr>
                <th>职位</th>
                <td><%= admin.getJob() %></td>
            </tr>
            <tr>
                <th>权限等级</th>
                <td><%= admin.getLevel() %></td>
            </tr>

        </table>
    </div>

    <div class="actions">
        <a href="SelectById2Servlet?id=<%= admin.getId() %>&flag=1">修改</a>
        <%--        <button onclick="history.back()">返回</button>--%>
        <a href="admin/adminIndex.jsp">主页</a>
    </div>
</div>




</body>
</html>
