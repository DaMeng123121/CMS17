<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/7/17
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.task.vo.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>普通职员列表信息</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 20px;
    }
    h1 {
      text-align: center;
      color: #333333;
    }
    table {
      width: 80%;
      margin: 20px auto;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    table th, table td {
      padding: 10px;
      text-align: center;
      border: 1px solid #dddddd;
    }
    table th {
      background-color: #f2f2f2;
    }
    table tr:nth-child(even) {
      background-color: #f9f9f9;
    }
    table tr:hover {
      background-color: #f1f1f1;
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
    .a1 {
      text-decoration: none;
    }
    .a1:hover{
      color: #1e90ff;

    }
  </style>
</head>

<body>
<%
  List<Employee> employeeList = (List<Employee>) request.getAttribute("employeeList");
%>

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
    <th>权限等级</th>
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
  <%}%>
  </tbody>
</table>

<div style="text-align: center; margin-top: 20px;">
  <button><a href="admin/adminIndex.jsp" class="a1">返回主页</a></button>
</div>
</body>
</html>