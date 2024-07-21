<%@ page import="java.util.List" %>
<%@ page import="com.task.vo.Employee" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>普通职员列表信息</title>
  <style>
    body {
      background-size: cover;
      background-position: center;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    span {
      line-height: 100vh; /* 垂直居中 */
      font-size: 50px;
      color: white;
    }
    h1 {
      text-align: center;
      color: #333333;
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
    table {
      width: 80%;
      margin: 20px auto;
      border-collapse: collapse;
      background-color: rgba(255, 255, 255, 0.2);
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    table th, table td {
      padding: 10px;
      text-align: center;
      border: 1px solid rgba(221, 221, 221, 0.2);
    }
    table th {
      background-color: rgba(242, 242, 242, 0.2);
    }
    table tr:nth-child(even) {
      background-color: rgba(249, 249, 249, 0.2);
    }
    table tr:hover {
      background-color: rgba(241, 241, 241, 0.2);
    }
    .actions {
      text-align: center;
      margin-bottom: 50px;
    }
    .actions a {
      margin: 0 5px;
      color: rgba(30, 144, 255, 0.2); /* 蓝色按钮 */
      text-decoration: none;
      background-color: rgba(255, 255, 255, 0.5); /* 按钮背景色 */
      padding: 10px 20px;
      border-radius: 5px;
      border: 1px solid rgba(30, 144, 255, 0.2); /* 蓝色边框 */
      transition: background-color 0.3s, color 0.3s;
      display: inline-block;
    }
    .actions a:hover {
      background-color: rgba(30, 144, 255, 0.4); /* 鼠标悬停时背景色 */
      color: rgba(255, 255, 255, 0.4); /* 鼠标悬停时字体颜色 */
    }
    .actions button {
      display: inline-block; /* 或者根据需要调整为 block */
      margin: 10px auto; /* 调整上下外边距，左右自动居中 */
      /*margin-left: 10px;*/
      padding: 10px 20px;
      background-color: rgba(242, 242, 242, 0.4); /* 按钮背景色 */
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s, color 0.3s;
      z-index: 2;        }
    .actions button:hover {
      background-color: rgba(30, 144, 255, 0.3); /* 鼠标悬停时背景色 */
      color: rgba(255, 255, 255, 0.3); /* 鼠标悬停时字体颜色 */
      z-index: 2;
    }


  </style>
</head>


<body >
<script src="change.js" type="text/javascript"></script>

<%
  List<Employee> employeeList = (List<Employee>) request.getAttribute("employeeList");
%>
<div class="container">
<table border="1">
  <thead>
  <tr>
    <th>工号</th>
    <th>姓名</th>
    <th>密码</th>
    <th>性别</th>
    <th>年龄</th>
    <th>电话号码</th>
    <th>邮箱地址</th>
    <th>家庭住址</th>
    <th>职务</th>
    <th>所属部门</th>
    <th>是否在职</th>
    <th>操作</th>
  </tr>
  </thead>
  <tbody>
  <%
    for (Employee employee : employeeList) {
  %>
  <tr>
    <td><%= employee.getId() %></td>
    <td><%= employee.getName() %></td>
    <td><%= employee.getPassword() %></td>
    <td><%= employee.getSex() %></td>
    <td><%= employee.getAge() %></td>
    <td><%= employee.getTel() %></td>
    <td><%= employee.getEmail() %></td>
    <td><%= employee.getAddress() %></td>
    <td><%= employee.getJob() %></td>
    <td><%= employee.getDept() %></td>
    <td><%= employee.getIfon() %></td>

    <td class="actions">
      <a href="DeleteEmployeeServlet?id=<%= employee.getId() %>" onclick="deleteConfirm()">删除</a>
      <a href="SelectByIdServlet?id=<%= employee.getId() %>&flag=2">修改</a>
    </td>
  </tr>
  <% } %>
  </tbody>
</table>

<div class="actions">
  <button><a href="admin/adminIndex.jsp">主页</a></button>

</div>
</div>
</body>
</html>
