package com.task.servlet;
import com.task.dao.AdminDao;
import com.task.dao.EmployeeDao;
import com.task.daoImpl.AdminDaoImpl;
import com.task.daoImpl.EmployeeDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
        String pwd = req.getParameter("password");
        String level = req.getParameter("level");



        String flag=null;
        HttpSession session = req.getSession();
        EmployeeDao ed = new EmployeeDaoImpl();
        AdminDao ad = new AdminDaoImpl();
        if(level.equals("employee")){

            flag = ed.employeeLogin(id, pwd);

        }else if(level.equals("admin")){

            flag = ad.adminLogin(id, pwd);

        }
        if (flag!=null){
            session.setAttribute("id",id);
            session.setAttribute("level", level);
            session.setAttribute("name", flag);
            if (level.equals("employee")){
                resp.sendRedirect("employee/employeeIndex.jsp");
            } else {
                resp.sendRedirect("admin/adminIndex.jsp");
            }


        }else {
            PrintWriter printWriter = resp.getWriter();
            printWriter.write("<script language='javascript'>alert('Please Input Right Information');window.location.href='login.jsp'</script>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
