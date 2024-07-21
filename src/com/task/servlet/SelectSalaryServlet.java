package com.task.servlet;

import com.task.dao.EmployeeDao;
import com.task.daoImpl.EmployeeDaoImpl;
import com.task.vo.Salary;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class SelectSalaryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
        int ifAdmin = Integer.parseInt(req.getParameter("ifAdmin"));
        EmployeeDao ed = new EmployeeDaoImpl();
        Salary salary = ed.selectSalary(id, ifAdmin);
        req.setAttribute("salary",salary);
        req.getRequestDispatcher("salary.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
