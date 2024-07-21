package com.task.servlet;

import com.task.dao.AdminDao;
import com.task.dao.EmployeeDao;
import com.task.daoImpl.AdminDaoImpl;
import com.task.daoImpl.EmployeeDaoImpl;
import com.task.vo.Admin;
import com.task.vo.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class SelectByIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
        int flag=Integer.parseInt(req.getParameter("flag"));
        EmployeeDao ed = new EmployeeDaoImpl();
        Employee employee = ed.employeeSelectById(id);
        req.setAttribute("employeeinfo", employee);
        if (flag==0){
            req.getRequestDispatcher("employee/employeeInfo.jsp").forward(req, resp);
        }
        else if(flag==1){
            req.getRequestDispatcher("employee/employeeUpdateInfo.jsp").forward(req, resp);
        } else if (flag==2) {
            req.getRequestDispatcher("admin/employeeUpdate1Info.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
