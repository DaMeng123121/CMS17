package com.task.servlet;

import com.task.dao.AdminDao;
import com.task.daoImpl.AdminDaoImpl;
import com.task.vo.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

public class AddEmployeeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        AdminDao ad = new AdminDaoImpl();
        Employee employee = new Employee();
        employee.setName(req.getParameter("name"));
        employee.setAge(Integer.parseInt(req.getParameter("age")));
        employee.setSex(req.getParameter("sex"));
        employee.setPassword(req.getParameter("password"));
        employee.setTel(req.getParameter("tel"));
        employee.setEmail(req.getParameter("email"));
        employee.setAddress(req.getParameter("address"));
        employee.setJob(req.getParameter("job"));
        employee.setDept(req.getParameter("dept"));
        boolean ifAdd = ad.addEmployee(employee);
        if (ifAdd){
            resp.sendRedirect("SelectAllEmployee");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
